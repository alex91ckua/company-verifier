class CreateGtMetrixTests < ActiveRecord::Migration[5.1]
  def change
    create_table :gt_metrix_tests do |t|
      t.references :company, foreign_key: true
      t.integer :page_load_time
      t.integer :pagespeed_score
      t.integer :yslow_score
      t.integer :fully_loaded_time
      t.string :report_url

      t.timestamps
    end
  end
end
