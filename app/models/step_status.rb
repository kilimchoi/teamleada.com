class StepStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :step
end
