class ProjectImageSubmissionUploader < ProjectFileSubmissionUploader

  def extension_white_list
    %w(jpg jpeg png)
  end

end
