class AddCodenameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :codename, :string, unique: true
  end
end
