class InterviewQuestionSubmissionForm < Form

  delegate :content, to: :interview_question_submission

  validates :content, presence: true

  def initialize(user, interview_question)
    @user = user
    @interview_question = interview_question
  end

  def interview_question_submission
    @interview_question_submission ||= InterviewQuestionSubmission.new(user: @user, interview_question: @interview_question)
  end

  def set_attributes(params)
    interview_question_submission.content = params[:content] if params[:content].present?
  end

  def save
    interview_question_submission.save
  end

end

