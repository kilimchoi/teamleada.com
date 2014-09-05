class RemoveRequiredFromCodeSubmissions < ActiveRecord::Migration
  def change
    remove_column :code_submissions, :required
  end
end
