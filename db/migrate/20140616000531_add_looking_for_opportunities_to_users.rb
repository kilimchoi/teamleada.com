class AddLookingForOpportunitiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :looking_for_opportunities, :boolean, default: false
  end
end
