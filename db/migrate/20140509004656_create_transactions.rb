class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :item, polymorphic: true

      t.timestamps
    end
  end
end
