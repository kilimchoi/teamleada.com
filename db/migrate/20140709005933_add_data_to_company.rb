class AddDataToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :linkedin_company_id, :string
    add_column :companies, :type, :string
    add_column :companies, :industry, :string
    add_column :companies, :ticker, :string
  end
end
