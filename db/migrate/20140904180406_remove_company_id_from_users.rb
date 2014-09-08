class RemoveCompanyIdFromUsers < ActiveRecord::Migration
  def change
    User.all.each do |user|
      if user.company
        CompanyEmployee.create(user: user, company: user.company)
      end
    end

    remove_column :users, :company_id
  end
end
