class CreateCompanyProjects < ActiveRecord::Migration
  def change
    create_table :company_projects do |t|
      t.references :project
      t.references :company

      t.timestamps
    end
  end
end
