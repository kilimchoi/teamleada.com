class AddSlideIndexToCodeSubmission < ActiveRecord::Migration
  def change
    add_column :code_submissions, :slide_index, :integer
  end
end
