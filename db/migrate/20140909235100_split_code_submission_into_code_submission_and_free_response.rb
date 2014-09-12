class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      parent_class = code_submission.parent_type == "Step" ? Step : Lesson
      parent = parent_class.find(code_submission.parent_id)
      project_id = parent.project.id
      slide = parent.slides[code_submission.slide_index]
      type = slide.submission_context.submission_type

      # The reason why there are two for each case is that we have to include the old strings that the constants used to be.
      case type
      when SubmissionContext::CODE, "code"
        # Do nothing, it's already code.
      when SubmissionContext::COMPLETE_CODE, "complete_code"
        code_submission.is_complete_code = true
        code_submission.save
        next
      when SubmissionContext::RESPONSE, "response"
        content = FreeResponseSubmissionContent.create(
          content: code_submission.content,
        )
      when SubmissionContext::PRESENTATION_SLIDES_LINK, "presentation_slides_link"
        
      when SubmissionContext::PRESENTATION_VIDEO_LINK, "presentation_vid_linK"

      end

      project_submission = ProjectSubmission.find(code_submission.project_submission_id)
      project_submission.content_id = content.id
      project_submission.content_type = content.class.to_s
      code_submission.delete
    end
  end
end
