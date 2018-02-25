class AddColumnToTestingJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :testing_jobs, :finished, :boolean
  end
end
