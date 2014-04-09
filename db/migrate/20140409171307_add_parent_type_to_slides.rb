class AddParentTypeToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :parent_type, :string
  end
end
