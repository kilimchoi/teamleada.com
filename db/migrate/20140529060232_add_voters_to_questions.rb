class AddVotersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :voters, :text
  end
end
