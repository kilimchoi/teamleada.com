class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    add_column :code_submission_contents, :is_complete_code, :boolean, default: false
    add_column :code_submission_evaluations, :content_id, :integer
    add_column :code_submission_evaluations, :content_type, :string

    CodeSubmissionContent.all.each do |code_submission|
      parent_class = code_submission.parent_type == "Step" ? Step : Lesson
      parent = parent_class.find(code_submission.parent_id)
      project_id = parent.project.id
      slide = parent.slides[code_submission.slide_index]
      type = slide.submission_context.submission_type

      # The reason why there are two for each case is that we have to include the old strings that the constants used to be.
      case type
      when SubmissionContext::QUIZ
        next
      when SubmissionContext::CODE, "code"
        # Do nothing, it's already code.
        CodeSubmissionEvaluation.where(code_submission_id: code_submission.id).each do |evaluation|
          evaluation.content_id = code_submission.id
          evaluation.content_type = code_submission.class.to_s
          evaluation.save
        end
        next
      when SubmissionContext::COMPLETE_CODE, "complete_code"
        code_submission.is_complete_code = true
        code_submission.save

        CodeSubmissionEvaluation.where(code_submission_id: code_submission.id).each do |evaluation|
          evaluation.content_id = code_submission.id
          evaluation.content_type = code_submission.class.to_s
          evaluation.save
        end
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
        project_submission_id: code_submission.project_submission_id,
        created_at: code_submission.created_at,
        updated_at: code_submission.updated_at,
      )

      project_submission = ProjectSubmission.find(code_submission.project_submission_id)
      project_submission.content_id = content.id
      project_submission.content_type = content.class.to_s
      project_submission.save!

      CodeSubmissionEvaluation.where(code_submission_id: code_submission.id).each do |evaluation|
        evaluation.content_id = content.id
        evaluation.content_type = content.class.to_s
        evaluation.save
      end

      code_submission.delete
    end
  end
end
