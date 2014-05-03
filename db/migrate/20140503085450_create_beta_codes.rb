class CreateBetaCodes < ActiveRecord::Migration
  def change
    create_table :beta_codes do |t|
      t.string :code
      t.string :group

      t.timestamps
    end
  end
end
