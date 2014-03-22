class RequiredStep < ActiveRecord::Base
  belongs_to :required, class_name: 'Step'
  belongs_to :requiree, class_name: 'Step'
end
