class AddAttributesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :headline, :string
    add_column :companies, :location, :string
    add_column :companies, :founded_date, :date
    add_column :companies, :number_of_employees, :string
  end
end
