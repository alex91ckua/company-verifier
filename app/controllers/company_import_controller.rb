class CompanyImportController < ApplicationController
  def create

    csv_file = params['csv_file']
    mapped_fields = JSON.parse params['mapped_fields']

    CompaniesImportJob.perform_now(csv_file, mapped_fields)
    render :json => { :status => true, :message => 'Companies will be processed soon.' }
  end

  private

  def is_valid_company?

  end

end
