class MakeSubmissionEvaluationsFromCodeSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    rename_column :submission_evaluations, :project_submission_id_id, :project_submission_id
    add_column :code_submission_evaluation_contents, :submission_evaluation_id, :integer

    free_response_id = FreeResponseSubmissionContent.count > 0 ? FreeResponseSubmissionContent.first.id : 1
    CodeSubmissionEvaluationContent.all.each do |code_evaluation|
      id = code_evaluation.code_submission_id
      if CodeSubmissionContent.exists?(id)
        content = CodeSubmissionContent.find(id)
      else
        content = FreeResponseSubmissionContent.find(free_response_id)
        free_response_id += 1
      end
      project_submission_id = content.project_submission_id
      evaluation = SubmissionEvaluation.create(
        reviewer_id: code_evaluation.reviewer_id,
        reviewee_id: code_evaluation.reviewee_id,
        project_id: code_evaluation.project_id,
        project_submission_id: project_submission_id,
        body: code_evaluation.description,
        visible: code_evaluation.visible,
      )
      code_evaluation.submission_evaluation_id = evaluation.id
      code_evaluation.save
    end

    remove_column :code_submission_evaluation_contents, :description
    remove_column :code_submission_evaluation_contents, :visible
    remove_column :code_submission_evaluation_contents, :reviewer_id
    remove_column :code_submission_evaluation_contents, :reviewee_id
    remove_column :code_submission_evaluation_contents, :project_id
    remove_column :code_submission_evaluation_contents, :code_submission_id
  end
end
