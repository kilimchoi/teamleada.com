class AddVerifiedToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :verified?, :boolean
  end
end
