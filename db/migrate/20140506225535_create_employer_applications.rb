class CreateEmployerApplications < ActiveRecord::Migration
  def change
    create_table :employer_applications do |t|
      t.string :name
      t.string :email
      t.string :size
      t.string :industry
      t.string :custom_industry
      t.text :description

      t.timestamps
    end
  end
end
