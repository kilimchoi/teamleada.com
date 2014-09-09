class CreateProjectSubmissionsForCodeSubmissionContexts < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      submission = ProjectSubmission.create(
        user: code_submission.user,
        project: code_submission.project_from_parent,
        slide: code_submission.slide,
        content: code_submission
      )
      code_submission.project_submission = submission
      code_submission.save
    end
  end
end
