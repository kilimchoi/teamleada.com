class RenameSubmissionsToProjectScores < ActiveRecord::Migration
  def change
    rename_table :submissions, :project_scores
  end
end
