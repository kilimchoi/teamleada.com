# == Schema Information
#
# Table name: step_requirements
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  required_step_id :integer
#  requiree_step_id :integer
#

class StepRequirement < ActiveRecord::Base
  belongs_to :required_step, class_name: 'Step'
  belongs_to :requiree_step, class_name: 'Step'
end
