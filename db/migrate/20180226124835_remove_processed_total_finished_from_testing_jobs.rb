class RemoveProcessedTotalFinishedFromTestingJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :testing_jobs, :processed, :integer
    remove_column :testing_jobs, :total, :integer
    remove_column :testing_jobs, :finished, :boolean
  end
end
