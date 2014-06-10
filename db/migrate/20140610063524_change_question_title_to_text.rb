class ChangeQuestionTitleToText < ActiveRecord::Migration
  def change
    remove_column :questions, :title

    add_column :questions, :title, :text
  end
end
