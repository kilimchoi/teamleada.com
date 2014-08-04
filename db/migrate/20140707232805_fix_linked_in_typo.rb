class FixLinkedInTypo < ActiveRecord::Migration
  def change
      rename_column :users, :indutry, :industry
  end
end
