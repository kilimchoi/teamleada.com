class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user
      t.string :invited_email
      t.datetime :accepted_at
      t.references :invited_user

      t.timestamps
    end
  end
end
