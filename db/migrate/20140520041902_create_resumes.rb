class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :user

      t.timestamps
    end
  end
end
