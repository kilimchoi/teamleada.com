class AddPubIdToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :publication_id, :string
  end
end
