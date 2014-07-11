class RenameVerifiedInLinkedIn < ActiveRecord::Migration
  def change
    rename_column :universities, :verified?, :verified
    rename_column :companies, :verified?, :verified
  end
end
