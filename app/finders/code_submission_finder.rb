class CodeSubmissionFinder

  def execute(user, project, params)
    user.code_submissions.where(project: project)
  end

end

