class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions

  def completed_projects
    []
  end

  def in_progress_projects
    []
  end

  def completed_points(project)
    total = 0
    step_statuses.each do |step_status|
      if step_status.completed? && step_status.project == project
        total += step_status
      end
    end
    total
  end

end
