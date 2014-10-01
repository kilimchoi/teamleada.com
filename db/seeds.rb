# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Delete all current projects
ProjectSet.delete_all
Project.unscoped.delete_all
Lesson.delete_all
Step.delete_all
Slide.delete_all
SubmissionContext.unscoped.delete_all

Quiz.delete_all

InterviewQuestion.delete_all

# Loads seed files from db/seeds
def load_from_folder(folder)
  Dir[File.join(Rails.root, 'db', 'seeds', folder, '*.rb')].sort.each do |seed|
    puts "Seeding #{seed}."
    load seed
  end
end

##############
# Create a separate folder for each type of seed file.
# Load in all environments.
##############

folders = [
  'projects',
  'projects/quizzes',
  'charts',
  'company',
  'user_actions',
  'interview_questions',
]

folders.each do |folder|
  load_from_folder(folder)
end

# Load per environment
if Rails.env.development?
  load_from_folder('development')
end

if Rails.env.production?
  load_from_folder('production')
end

