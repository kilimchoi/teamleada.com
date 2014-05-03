class CreateUserCodes < ActiveRecord::Migration
  def change
    create_table :user_codes do |t|
      t.references :user
      t.references :codes

      t.timestamps
    end
  end
end
