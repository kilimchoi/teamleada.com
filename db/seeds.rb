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

work_with_data_content = "Notice that you are given two datasets [Train/Test]! We will disect and vizualize data, and eventually clean them.

In general Data Scientists build models using cleaned Training data and then make predictions utilizing cleaned Test data.
"
learn_and_apply_content = "Welcome to the Tools Screen. There are many models that can be applied to this data project, but we will only go over two: generalized linear models (GLM) and Classification Trees (CT).
"

work_with_data = Step.create!(title: "Work with the data", content: work_with_data_content)
learn_and_apply = Step.create!(title: "Learn and apply Analytics tools here", content: learn_and_apply_content)
welcome_lesson.steps << [work_with_data, learn_and_apply]

# Work with Data
training_data_content = "This is the place where you work with training data. You can view, vizualize, and eventually modify the data."
training_data = Step.create!(title: "Work with the training data", content: training_data_content, previous_step: work_with_data)

testing_data_content = "This is the place where you work with testing data. You can view, vizualize, and eventually modify the data."
testing_data = Step.create!(title: "Work with the testing data", content: testing_data_content, previous_step: work_with_data)

# Training Data
view_training_data_content = ""
view_training_data = Step.create!(title: "View the training data", content: view_training_data_content, previous_step: training_data)

visualize_training_data_content = ""
visualize_training_data = Step.create!(title: "Visualize the training data", content: visualize_training_data_content, previous_step: training_data)

manipulate_training_data_content = ""
manipulate_training_data = Step.create!(title: "Manipulate the training data", content: manipulate_training_data_content, previous_step: training_data)

# Testing Data
view_testing_data_content = ""
view_testing_data = Step.create!(title: "View the testing data", content: view_testing_data_content, previous_step: testing_data)
