class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :value
      t.string :group

      t.timestamps
    end
  end
end
