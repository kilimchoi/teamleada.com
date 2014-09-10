class SplitCodeSubmissionEvaluationContentWithFreeResponse < ActiveRecord::Migration
  def change
    FreeResponseSubmissionContent.all.each do |free_response|
      submission = ProjectSubmission.find(free_response.project_submission_id)
      submission.content_type = free_response.class.to_s
      submission.save
    end

    SubmissionEvaluation.all.each do |evaluation|
      project_submission = ProjectSubmission.find(evaluation.project_submission_id)
      if project_submission.content_type == "FreeResponseSubmissionContent"
        code = CodeSubmissionEvaluationContent.find(evaluation.content_id)
        FreeResponseSubmissionEvaluationContent.create(
          computer_science: code.computer_science,
          statistics: code.statistics,
          curiosity: code.curiosity,
          communication: code.communication,
        )

        code.delete
      end
    end
  end
end
