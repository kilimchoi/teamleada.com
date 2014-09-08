class AddAboutAndWebsiteToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :about, :text
    add_column :companies, :website, :string
  end
end
