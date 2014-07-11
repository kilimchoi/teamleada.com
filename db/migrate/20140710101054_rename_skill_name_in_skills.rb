class RenameSkillNameInSkills < ActiveRecord::Migration
  def change
    rename_column :skills, :skill_name, :name
  end
end
