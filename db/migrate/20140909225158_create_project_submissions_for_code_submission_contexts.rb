class CreateProjectSubmissionsForCodeSubmissionContexts < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      submission = ProjectSubmission.create(
        user: code_submission.user,
        project: code_submission.project,
        slide: code_submission.slide,
        content: code_submission
      )
    end
  end
end
