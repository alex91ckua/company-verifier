class AddCompanyToTestingJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :testing_jobs, :company, foreign_key: true, after: :id
  end
end
