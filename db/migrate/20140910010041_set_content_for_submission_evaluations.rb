class SetContentForSubmissionEvaluations < ActiveRecord::Migration
  def change
    CodeSubmissionEvaluationContent.all.each do |content|
      submission = SubmissionEvaluation.find(content.submission_evaluation_id)
      submission.content_id = content.id
      submission.content_type = content.class.to_s
      submission.save
    end

    remove_column :code_submission_evaluation_contents, :submission_evaluation_id
  end
end
