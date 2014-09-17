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
#

class NumericRangeQuiz < Quiz
end
