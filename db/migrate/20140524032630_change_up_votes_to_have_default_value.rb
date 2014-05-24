class ChangeUpVotesToHaveDefaultValue < ActiveRecord::Migration
  def change
    change_column :questions, :up_votes, :integer, default: 0
  end
end
