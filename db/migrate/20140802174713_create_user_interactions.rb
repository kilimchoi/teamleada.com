class CreateUserInteractions < ActiveRecord::Migration
  def change
    create_table :user_interactions do |t|
      t.references :company
      t.references :interactor
      t.references :interactee

      t.boolean :favorited, default: false
      t.datetime :favorited_at

      t.boolean :contacted, default: false
      t.datetime :first_contacted_at

      t.boolean :hired, default: false
      t.datetime :hired_at

      t.timestamps
    end
  end
end
