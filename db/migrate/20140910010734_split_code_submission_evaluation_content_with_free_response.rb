class SplitCodeSubmissionEvaluationContentWithFreeResponse < ActiveRecord::Migration
  def change
    SubmissionEvaluation.all.each do |evaluation|
      project_submission = ProjectSubmission.find(evaluation.project_submission_id)
      if project_submission.content_type == "FreeResponseSubmissionContent"
        code = CodeSubmissionEvaluationContent.find(evaluation.content_id)
        FreeResponseSubmissionEvaluationContent.create(
          computer_science: code.computer_science,
          statistics: code.statistics,
          curiosity: code.curiosity,
          communication: code.communication,
          created_at: code.created_at,
          updated_at: code.updated_at,
        )

        code.delete
      end
    end
  end
end
