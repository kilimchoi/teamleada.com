class AddUrlToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :url, :string
  end
end
