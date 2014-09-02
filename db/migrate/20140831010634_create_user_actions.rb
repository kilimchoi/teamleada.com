class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.string :name

      t.timestamps
    end
  end
end
