class ChangeGroupToAccessType < ActiveRecord::Migration
  def change
    add_column :codes, :access_type, :string

    Code.all.each do |code|
      code.access_type = code.group
      code.save
    end

    remove_column :codes, :group
  end
end
