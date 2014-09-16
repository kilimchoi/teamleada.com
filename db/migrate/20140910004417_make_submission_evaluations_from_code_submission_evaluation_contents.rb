class MakeSubmissionEvaluationsFromCodeSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    rename_column :submission_evaluations, :project_submission_id_id, :project_submission_id
    add_column :code_submission_evaluation_contents, :submission_evaluation_id, :integer

    CodeSubmissionEvaluationContent.all.each do |code_evaluation|
      content_id = code_evaluation.content_id
      content_type = code_evaluation.content_type
      project_submission = ProjectSubmission.find_by(content_id: content_id, content_type: content_type)

      evaluation = SubmissionEvaluation.create(
        reviewer_id: code_evaluation.reviewer_id,
        reviewee_id: code_evaluation.reviewee_id,
        project_id: code_evaluation.project_id,
        project_submission_id: project_submission.id,
        body: code_evaluation.description,
        visible: code_evaluation.visible,
        created_at: code_evaluation.created_at,
        updated_at: code_evaluation.updated_at,
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

    remove_column :code_submission_evaluation_contents, :content_id
    remove_column :code_submission_evaluation_contents, :content_type
  end
end
