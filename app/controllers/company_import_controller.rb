class CompanyImportController < ApplicationController
  def create
    require('csv')

    csv_file = params['csv_file']
    mapped_fields = JSON.parse params['mapped_fields']
    imported_companies_count = 0
    csv_columns_count = CSV.read(csv_file.path, headers: true).length

    CSV.foreach(csv_file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|

      name = row[mapped_fields['name']]
      website_url = row[mapped_fields['website_url']]
      email = row[mapped_fields['email']]
      @company = Company.create(  :name => name,
                                  :website_url => website_url,
                                  :email => email )
      imported_companies_count += 1 if @company.valid?
    end

    if imported_companies_count == csv_columns_count
      msg = { :status => true, :message => 'All companies has been imported' }
    else
      msg = { :status => false, :message => "Imported #{imported_companies_count} from #{csv_columns_count}" }
    end

    render :json => msg
  end

  private

  def is_valid_company?

  end

end
