class AddNumberToProject < ActiveRecord::Migration
  def change
    add_column :projects, :number, :integer
  end
end
