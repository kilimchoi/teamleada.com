# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  quiz_id    :string(255)
#  answer     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Quiz < ActiveRecord::Base
  has_many :quiz_submission

  ###################
  ###Static Methods##
  ###################
  
  def self.sanitize_answer(answer)
    return ActionController::Base.helpers.sanitize(answer)
  end
end
