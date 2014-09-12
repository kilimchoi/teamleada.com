class CreateProjectSubmissionsForCodeSubmissionContexts < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      parent_class = code_submission.parent_type == "Step" ? Step : Lesson
      parent = parent_class.find(code_submission.parent_id)
      project_id = parent.project.id
      slide_id = parent.slides[code_submission.slide_index].id
      submission = ProjectSubmission.create(
        user_id: code_submission.user_id,
        project_id: project_id,
        slide_id: slide_id,
        content_id: code_submission.id,
        content_type: code_submission.class.to_s,
      )
      code_submission.project_submission_id = submission.id
      code_submission.save
    end
  end
end
