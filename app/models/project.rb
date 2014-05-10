class Project < ActiveRecord::Base
  require 'csv'
  serialize :description, Array

  has_many :lessons, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :transactions, as: :item

  before_create :set_url

  validates :title, uniqueness: true

  scope :costs_money, -> { where(paid: true) }

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def cost_in_dollars
    "%.2f" % (cost / 100)
  end

  def check_submission(file)
    # Method to check the submission that the user uploaded
    solution_file = File.expand_path("#{Rails.root}/db/project_solutions/#{"%03d" % self.number}-#{self.url}.csv", __FILE__)
    solution_hash = {}

    CSV.foreach(solution_file, :headers => true) do |row|
      solution_hash[row[0]] = row[1]
    end

    total = Float(solution_hash.length)
    correct = 0

    CSV.foreach(file.path, :headers => true) do |row|
      if (solution_hash[row[0]] == row[1]) #if correct answer
        correct += 1
      end
    end

    return correct / total
  end

  def score_improved?(score, submission)
    if submission.nil?
      return false
    end
    score <= submission.score ? false : true
  end

  def submission_rank(submission)
    submissions.each_with_index do |sub, index|
      if sub == submission
        return index + 1
      end
    end
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
