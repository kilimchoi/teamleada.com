class Step < ActiveRecord::Base
  belongs_to :lesson
  has_many :next_steps, foreign_key: :previous_step_id, class_name: "Step"

  belongs_to :previous_step, class_name: "Step"
end
