class ChangeCodesIdToCodeId < ActiveRecord::Migration
  def change
    remove_column :user_codes, :codes_id
    add_column :user_codes, :code_id, :integer
  end
end
