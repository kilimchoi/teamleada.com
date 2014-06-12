class RemoveDateStringAddDateToDays < ActiveRecord::Migration
  def change
    remove_column :days, :date_string
    add_column :days, :date, :date
  end
end
