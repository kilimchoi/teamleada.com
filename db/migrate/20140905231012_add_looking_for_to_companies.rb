class AddLookingForToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :looking_for, :text
  end
end
