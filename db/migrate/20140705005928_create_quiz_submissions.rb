class CreateQuizSubmissions < ActiveRecord::Migration
  def change
    create_table :quiz_submissions do |t|
      t.references :user, index: true
      t.references :quiz, index: true
      t.string :submitted_answer

      t.timestamps
    end
  end
end
