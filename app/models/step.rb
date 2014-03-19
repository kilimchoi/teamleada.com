class Step < ActiveRecord::Base
  belongs_to :lesson
  has_one :next_step
  has_one :previous_step
end
