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

class ExactAnswerQuiz < Quiz

  def is_correct?(user_input)
    # Given a "user_input", returns True if the user_input matches the answer.
    answer == user_input || whitespace_and_lower_pass(user_input) || equalsign_pass(user_input) || quoteless_pass(user_input)
  end

end
