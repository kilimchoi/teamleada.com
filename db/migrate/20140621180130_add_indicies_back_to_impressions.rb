class AddIndiciesBackToImpressions < ActiveRecord::Migration
  def change
    add_index :impressions, [:impressionable_type, :message, :impressionable_id], :name => "impressionable_type_message_index", :unique => false, :length => {:message => 255 }
    add_index :impressions, [:impressionable_type, :impressionable_id, :request_hash], :name => "poly_request_index", :unique => false
    add_index :impressions, [:impressionable_type, :impressionable_id, :ip_address], :name => "poly_ip_index", :unique => false
    add_index :impressions, [:impressionable_type, :impressionable_id, :session_hash], :name => "poly_session_index", :unique => false
  end
end
