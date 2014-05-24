class AddEnabledToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :enabled, :boolean, default: true
  end
end
