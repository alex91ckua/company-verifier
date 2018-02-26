class RemoveTestedFromCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :tested, :boolean
  end
end
