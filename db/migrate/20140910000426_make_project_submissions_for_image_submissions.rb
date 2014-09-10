class MakeProjectSubmissionsForImageSubmissions < ActiveRecord::Migration
  def change
    add_column :file_submission_contents, :project_submission_id, :integer

    ImageSubmissionContent.all.each do |image_submission|
      slide_id = image_submission.project_id == 15 ? Slide.find("p15_l2_sl1").id : nil
      submission = ProjectSubmission.create(
        user_id: image_submission.user_id,
        project_id: image_submission.project_id,
        slide_id: slide_id,
        content: image_submission,
      )
      image_submission.project_submission = submission
      image_submission.save
    end

    remove_column :file_submission_contents, :project_id
  end
end
