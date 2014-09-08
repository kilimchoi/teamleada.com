class CreateCompanyDataChallengeInterests < ActiveRecord::Migration
  def change
    create_table :company_data_challenge_interests do |t|
      t.references :company
      t.references :user

      t.timestamps
    end
  end
end
