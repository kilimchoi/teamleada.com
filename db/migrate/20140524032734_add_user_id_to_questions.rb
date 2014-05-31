class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :asker_id, :integer
  end
end
