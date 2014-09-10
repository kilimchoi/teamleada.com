class MakeProjectSubmissionsForImageSubmissions < ActiveRecord::Migration
  def change
    add_column :file_submission_contents, :project_submission_id, :integer

    ImageSubmissionContent.all.each do |image_submission|
      slide = image_submission.project_id == 15 ? Slide.find("p15_l2_sl1") : nil
      submission = ProjectSubmission.create(
        user: image_submission.user,
        project: image_submission.project,
        slide: slide,
        content: image_submission,
      )
      image_submission.project_submission = submission
      image_submission.save
    end

    remove_column :file_submission_contents, :project_id
  end
end
