module ProjectsHelper
  def self.deadline_in_days(project)
    if !project.deadline.nil?
      project.deadline.divmod(60 * 60 * 24)[0].to_s
    end
  end
end
