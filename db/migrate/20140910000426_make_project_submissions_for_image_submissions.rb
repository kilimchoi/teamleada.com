class MakeProjectSubmissionsForImageSubmissions < ActiveRecord::Migration
  def change
    add_column :file_submission_contents, :project_submission_id, :integer

    ImageSubmissionContent.all.each do |image_submission|
      slide_id = image_submission.project_id == 15 ? Slide.find("p15_l2_sl1").id : nil
      submission = ProjectSubmission.create(
        user_id: image_submission.user_id,
        project_id: image_submission.project_id,
        slide_id: slide_id,
        content_id: image_submission.id,
        content_type: "ImageSubmissionContent",
        created_at: image_submission.created_at,
        updated_at: image_submission.updated_at,
      )
      image_submission.project_submission_id = submission.id
      image_submission.save
    end

    remove_column :file_submission_contents, :project_id
  end
end
