class ChangeEnabledToEnabledForFeatures < ActiveRecord::Migration
  def change
    rename_column :features, :enabled?, :enabled
  end
end
