class AddHiddenToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :hidden, :boolean, default: false
  end
end
