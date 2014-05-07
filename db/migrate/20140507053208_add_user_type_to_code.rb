class AddUserTypeToCode < ActiveRecord::Migration
  def change
    add_column :codes, :user_type, :string
  end
end
