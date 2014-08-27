class CreateBrowsableUsers < ActiveRecord::Migration
  def change
    create_table :browsable_users do |t|
      t.references :company
      t.references :user

      t.timestamps
    end
  end
end
