class CompaniesImportJob < ApplicationJob
  queue_as :default

  def perform(csv_file, mapped_fields)
    require('csv')
    @imported_companies_count = 0
    @csv_columns_count = CSV.read(csv_file.path, headers: true).length

    CSV.foreach(csv_file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|

      name = row[mapped_fields['name']]
      website_url = row[mapped_fields['website_url']]
      email = row[mapped_fields['email']]
      company = Company.create(  :name => name,
                                  :website_url => website_url,
                                  :email => email )
      if company.valid?
        @imported_companies_count += 1
        # run website test via GtMetrix API
        gtmetrix_test(company)
      else
        # add some log message...
      end
    end

  end

  private

  def gtmetrix_test(company)
    require 'unirest'
    response = Unirest.post 'https://gtmetrix-gtmetrix.p.mashape.com/test',
                            headers:{
                                'Authorization' => 'Basic am9zaEBqbWFya2V0aW5nLmNvbS5hdTo3OGE5MTczZDQ0N2EzMGIyYTVjMzNjZDQ5ZjExMGY4Yg==',
                                'X-Mashape-Key' => 'SrZo6u3CT9mshZeqDPwRhCqEmQOzp1rftvCjsnBpcSn03sUIpH',
                                'Content-Type' => 'application/x-www-form-urlencoded',
                                'Accept' => 'application/json'
                            },
                            parameters:{
                                'url' => company.website_url
                            }

    # if GtMetrix test for website was created
    if response.body['test_id']
      # create job
      testing_job = TestingJob.create( :company => company, :test_id => response.body['test_id'] )
      # and re-check test status in 1 minute
      TestCompaniesJob.set(wait: 1.minute).perform_later(testing_job)
    end
  end

end
