class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend

      t.string :status

      t.datetime :requested_at
      t.datetime :accepted_at
      t.datetime :declined_at

      t.timestamps
    end
  end
end
