class RenameLinkedInRelatedId < ActiveRecord::Migration
  def change
    rename_column :publications, :publication_id, :linkedin_publication_id
    rename_column :skills, :skill_id, :linkedin_skill_id
  end
end
