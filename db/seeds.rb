# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create!(
  title: "Titanic: Machine Learning From Disaster",
  description: "This is a description of the project"
)

puts "Created project: #{project.title}."

welcome_lesson_content = "Welcome to your first data project! Here you will learn several tools for data analysis, build models, and do exploratory analysis! This project is taken from Kaggle, a data science competition website. The project is calledTitanic: Machine Learning from Disaster.

You are tasked to predict whether a passenger survived the Titanic crash. You are given two datasets (Train & Test) each of which include predictor variables such as Age, Passenger Class, Sex, etc. With these two data sets we will do the following:

1. Create a model which will predict whether a passenger survived using only the Train data set
2. Predict whether the passengers survived in the Test data set based on the model we created
"

welcome_lesson = Lesson.create!(
  title: "Welcome",
  content: welcome_lesson_content
)

project.lessons << welcome_lesson

welcome_lesson_steps = [
  "Work with the data",
  "Learn and apply Analytics tools here",
]

welcome_lesson_steps.each do |content|
  new_step = Step.create!(
    content: content
  )
  welcome_lesson.steps << new_step
end
