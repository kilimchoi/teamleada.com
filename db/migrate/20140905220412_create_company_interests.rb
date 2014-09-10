class CreateCompanyInterests < ActiveRecord::Migration
  def change
    create_table :company_interests do |t|
      t.references :company
      t.references :user

      t.timestamps
    end
  end
end
