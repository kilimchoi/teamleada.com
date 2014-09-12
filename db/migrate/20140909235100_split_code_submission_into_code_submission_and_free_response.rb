class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    add_column :code_submission_contents, :is_complete_code, :boolean, default: false

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
        next
      when SubmissionContext::COMPLETE_CODE, "complete_code"
        code_submission.is_complete_code = true
        code_submission.save
        next
      when SubmissionContext::RESPONSE, "response"
        content_class = FreeResponseSubmissionContent
      when SubmissionContext::PRESENTATION_SLIDES_LINK, "presentation_slides_link"
        content_class = SlidesLinkSubmissionContent
      when SubmissionContext::PRESENTATION_VIDEO_LINK, "presentation_vid_linK"
        content_class = VideoLinkSubmissionContent
      end

      content = content_class.create(
        content: code_submission.content,
      )

      project_submission = ProjectSubmission.find(code_submission.project_submission_id)
      project_submission.content_id = content.id
      project_submission.content_type = content.class.to_s
      code_submission.delete
    end
  end
end
