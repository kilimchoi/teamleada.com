class CreateCompanyEmployees < ActiveRecord::Migration
  def change
    create_table :company_employees do |t|
      t.references :user
      t.references :company

      t.timestamps
    end
  end
end
