class AddLastUpdatedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :updated_password_at, :datetime
  end
end
