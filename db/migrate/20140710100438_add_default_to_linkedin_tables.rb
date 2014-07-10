class AddDefaultToLinkedinTables < ActiveRecord::Migration
  def change
    change_column :universities, :verified, :boolean, :default => false
    change_column :companies, :verified, :boolean, :default => false
  end
end
