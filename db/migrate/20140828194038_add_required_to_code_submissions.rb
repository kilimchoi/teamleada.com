class AddRequiredToCodeSubmissions < ActiveRecord::Migration
  def change
    add_column :code_submissions, :required, :boolean, default: true
  end
end
