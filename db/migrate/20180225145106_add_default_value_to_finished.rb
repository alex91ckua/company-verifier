class AddDefaultValueToFinished < ActiveRecord::Migration[5.1]
  def up
    change_column :testing_jobs, :finished, :boolean, default: false
  end

  def down
    change_column :testing_jobs, :finished, :boolean, default: nil
  end
end
