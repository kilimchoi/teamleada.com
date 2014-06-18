class AddCollectionMethodToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :collection_method, :string
  end
end
