class ChangeDateToDateStringForDays < ActiveRecord::Migration
  def change
    remove_column :days, :date
    add_column :days, :date_string, :string
  end
end
