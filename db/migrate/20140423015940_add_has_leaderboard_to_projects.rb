class AddHasLeaderboardToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :has_leaderboard, :boolean, default: false
  end
end
