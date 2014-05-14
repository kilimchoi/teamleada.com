# == Schema Information
#
# Table name: company_projects
#
#  id         :integer          not null, primary key
#  project_id :integer
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class CompanyProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :company
end
