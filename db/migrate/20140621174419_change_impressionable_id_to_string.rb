class ChangeImpressionableIdToString < ActiveRecord::Migration
  def change
    remove_column :impressions, :impressionable_id
    add_column :impressions, :impressionable_id, :string
  end
end
