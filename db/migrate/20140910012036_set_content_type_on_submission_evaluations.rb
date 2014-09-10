class SetContentTypeOnSubmissionEvaluations < ActiveRecord::Migration
  def change
    SubmissionEvaluation.all.each do |evaluation|
      project_submission = ProjectSubmission.find(evaluation.project_submission_id)
      if project_submission.content_type == "FreeResponseSubmissionContent"
        evaluation.content_type = "FreeResponseSubmissionEvaluationContent"
        evaluation.save
      end
    end
  end
end
