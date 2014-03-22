class Project < ActiveRecord::Base
  require 'CSV'

  has_many :lessons
  has_many :submissions

  before_create :set_url

  validates :title, uniqueness: true

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def check_submission(file)
    # Method to check the submission that the user uploaded
    solution_file = File.expand_path("#{Rails.root}/db/project_solutions/#{"%03d" % self.number}-#{self.url}.csv", __FILE__)
    CSV.foreach(solution_file) do |row|
      puts row
    end
  end

end
