class StepRequirement < ActiveRecord::Base
  belongs_to :required_step, class_name: 'Step'
  belongs_to :requiree_step, class_name: 'Step'
end
