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

class NumericRangeQuiz < Quiz

  def is_correct?(user_input)
    integer_user_input = user_input.to_f
    if (not self.lower_bound.nil?) && (not self.upper_bound.nil?)
      self.lower_bound <= integer_user_input && integer_user_input <= self.upper_bound
    elsif self.lower_bound.nil?
      integer_user_input <= self.upper_bound
    elsif self.upper_bound.nil?
      self.lower_bound <= integer_user_input
    else
      false
    end
  end

end
