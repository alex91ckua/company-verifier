class AddColumnToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :tested, :boolean, :default => false
  end
end
