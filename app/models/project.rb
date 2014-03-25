class Project < ActiveRecord::Base
  require 'csv'

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
    solution_hash = {}

    CSV.foreach(solution_file, :headers => true) do |row|
      soln_hash[row[0]] = row[1]
    end

    total = Float(soln_hash.length)
    correct = 0

    CSV.foreach(file, :headers => true) do |row|
      if (soln_hash[row[0]] == row[1]) #if correct answer
        correct += 1
      end
    end

    return correct / total
  end

  def total_points
    total = 0
    lessons.each do |lesson|
      lesson.steps.each do |step|
        total += step.points
      end
    end
    total
  end

end
