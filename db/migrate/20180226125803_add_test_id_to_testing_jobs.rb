class AddTestIdToTestingJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :testing_jobs, :test_id, :string
  end
end
