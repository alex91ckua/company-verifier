class CompaniesImportJob < ApplicationJob
  queue_as :default

  after_perform :after_perform

  def perform(csv_file, mapped_fields)
    require('csv')
    @imported_companies_count = 0
    @csv_columns_count = CSV.read(csv_file.path, headers: true).length

    # add testing job for correspondent job into db
    add_testing_job

    CSV.foreach(csv_file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|

      name = row[mapped_fields['name']]
      website_url = row[mapped_fields['website_url']]
      email = row[mapped_fields['email']]
      @company = Company.create(  :name => name,
                                  :website_url => website_url,
                                  :email => email )
      @imported_companies_count += 1 if @company.valid?
    end

  end

  private

  def add_testing_job
    @testing_job = TestingJob.create( :processed => @imported_companies_count, :total => @csv_columns_count )
  end

  def after_perform
    @testing_job.processed = @imported_companies_count
    @testing_job.finished = true
    @testing_job.save
  end

end
