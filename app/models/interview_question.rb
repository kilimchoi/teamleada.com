# == Schema Information
#
# Table name: interview_questions
#
#  title            :string(255)
#  difficulty_level :integer
#  question         :text
#  posted_at        :datetime
#  industry         :integer
#  question_type    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  uid              :integer          not null, primary key
#  multiple_choices :text
#

class InterviewQuestion < ActiveRecord::Base
  obfuscate_id spin: 9987654

  enum industry: [ :data_science ]
  enum question_type: [ :free_response, :code, :multiple_choice ]
  serialize :multiple_choices

  has_many :interview_question_submissions
  has_many :users, through: :interview_question_submissions

  # Tags
  has_many :taggings, as: :tagged
  has_many :tags, through: :taggings

  scope :displayable_for_user, -> (user) { where(uid: InterviewQuestion.displayable_ids_for_user(user)) }

  class << self
    def displayable_ids_for_user(user)
      InterviewQuestion.select { |interview_question| !user.has_submission_for_interview_question?(interview_question) }.map(&:uid)
    end
  end

  def tag_list
    tags.pluck(:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

end
