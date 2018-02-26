class AddStateToGtMetrixTests < ActiveRecord::Migration[5.1]
  def change
    add_column :gt_metrix_tests, :state, :string, after: :report_url
  end
end
