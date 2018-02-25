class CreateTestingJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :testing_jobs do |t|
      t.integer :processed
      t.integer :total

      t.timestamps
    end
  end
end
