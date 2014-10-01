class CreateVideoLinkSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    create_table :video_link_submission_evaluation_contents do |t|

      t.timestamps
    end
  end
end
