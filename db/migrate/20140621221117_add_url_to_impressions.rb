class AddUrlToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :url, :string
  end
end
