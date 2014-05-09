class AddColumnsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :integer
    add_column :transactions, :stripe_charge_id, :integer
    add_column :transactions, :charged, :boolean, default: false
  end
end
