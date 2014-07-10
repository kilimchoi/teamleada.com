class CodeSubmissionFinder

  def execute(user, project)
    user.code_submissions.where(project: project)
  end

end

