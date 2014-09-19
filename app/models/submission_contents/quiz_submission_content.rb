# == Schema Information
#
# Table name: quiz_submissions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  quiz_id          :string(255)
#  submitted_answer :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class QuizSubmissionContent < GeneralSubmissionContent
  belongs_to :quiz, polymorphic: true

  class << self
    def create_with_user_project_slide_quiz_content(user, project, slide, quiz, content)
      quiz_submission = QuizSubmissionContent.create_with_user_project_slide_content(user, project, slide, content)
      quiz_submission.quiz = quiz
      quiz_submission.save
    end
  end

  def quiz_via_id
    Quiz.find_by(quiz_id: quiz_id)
  end

end
