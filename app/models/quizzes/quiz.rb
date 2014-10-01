# == Schema Information
#
# Table name: quizzes
#
#  id               :integer          not null
#  quiz_id          :string(255)      primary key
#  answer           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  project_id       :integer
#  type             :string(255)
#  multiple_choices :text
#  lower_bound      :decimal(10, 5)
#  upper_bound      :decimal(10, 5)
#  slide_id         :string(255)
#  question         :text
#

class Quiz < ActiveRecord::Base
  self.primary_key = "quiz_id"

  belongs_to :project
  belongs_to :slide

  has_many :quiz_submission_contents

  validates :project, presence: true
  validates :quiz_id, uniqueness: true, presence: true
  validates :slide_id, uniqueness: true, presence: true
  validates :question, presence: true

  class << self
    def lower_and_clean(input)
      # Given an input, loswercases and cleans white spaces.
      input.to_s.downcase.gsub(/\s+/, "")
    end

    def sanitize_answer(answer)
      ActionController::Base.helpers.sanitize(answer)
    end
  end

  def correct_answer?(user_input)
    self.is_correct?(user_input)
  end

  # Helpers
  def quoteless_pass(user_input)
    # Returns T/F depending of answer == user_input, after we remove all quotes.
    quote_removed_input = Quiz.lower_and_clean(user_input).gsub(/'|"/, "")
    quote_removed_answer = Quiz.lower_and_clean(answer).gsub(/'|"/, "")

    quote_removed_input == quote_removed_answer
  end

  def whitespace_and_lower_pass(user_input)
    # Returns T/F depending of answer == user_input, after we remove all white spaces.
    space_removed_input = Quiz.lower_and_clean(user_input) #user_input.gsub(/\s+/, "")
    space_removed_answer = Quiz.lower_and_clean(answer) #answer.gsub(/\s+/, "")

    space_removed_input == space_removed_answer
  end

  def equalsign_pass(user_input)
    # Return T/F while taking into account that "<-" and "=" are the same
    # Removes white spaces too
    space_removed_input = Quiz.lower_and_clean(user_input) #user_input.gsub(/\s+/, "")
    space_removed_answer = Quiz.lower_and_clean(answer) #answer.gsub(/\s+/, "")

    equalized_input = space_removed_input.gsub('<-', '=')
    equalized_answer = space_removed_answer.gsub('<-', '=')
    equalized_input == equalized_answer
  end

end
