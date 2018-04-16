class CreateTestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :test_logs do |t|
      t.references :company, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
