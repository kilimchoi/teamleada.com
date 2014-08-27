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
  belongs_to :project
  validates :project, :presence => true

  validates :quiz_id, uniqueness: true, presence: true

  def correct_answer?(user_input)
    '''
    Given a "user_input", returns True if the user_input matches the answer.
    '''
    answer == user_input || whitespace_and_lower_pass(user_input) || equalsign_pass(user_input) || quoteless_pass(user_input)
  end

  def quoteless_pass(user_input)
    '''
    Returns T/F depending of answer == user_input, after we remove all quotes.
    '''
    quote_removed_input = Quiz.lower_and_clean(user_input).gsub(/'|"/, "") 
    quote_removed_answer = Quiz.lower_and_clean(answer).gsub(/'|"/, "") 

    quote_removed_input == quote_removed_answer
  end

  def whitespace_and_lower_pass(user_input)
    '''
    Returns T/F depending of answer == user_input, after we remove all white spaces.
    '''
    space_removed_input = Quiz.lower_and_clean(user_input) #user_input.gsub(/\s+/, "")
    space_removed_answer = Quiz.lower_and_clean(answer) #answer.gsub(/\s+/, "")

    space_removed_input == space_removed_answer
  end

  def equalsign_pass(user_input)
    '''
    Return T/F while taking into account that "<-" and "=" are the same
    Removes white spaces too
    '''
    space_removed_input = Quiz.lower_and_clean(user_input) #user_input.gsub(/\s+/, "")
    space_removed_answer = Quiz.lower_and_clean(answer) #answer.gsub(/\s+/, "")

    equalized_input = space_removed_input.gsub('<-', '=')
    equalized_answer = space_removed_answer.gsub('<-', '=')
    equalized_input == equalized_answer
  end

  ###################
  ###Static Methods##
  ###################
  
  def self.lower_and_clean(input)
    '''
    Given an input, loswercases and cleans white spaces.
    '''
    input.to_s.downcase.gsub(/\s+/, "")
  end

  def self.sanitize_answer(answer)
    return ActionController::Base.helpers.sanitize(answer)
  end

end
