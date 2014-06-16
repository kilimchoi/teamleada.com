class AddCompanyOverviewToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :company_overview, :text
  end
end
