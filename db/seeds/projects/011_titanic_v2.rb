main_page_load = [
  ['text', 'You are tasked with predicting whether a passenger survived the Titanic crash. You are given two datasets (Train & Test) each of which include passengers on the Titanic with their Age, Passenger Class, Sex, etc.'],
  ['text', 'You will compelte the following:'],
  ['text', '1. Clean the raw Titanic Data'],
  ['text', '2. Build some Vizualization for the raw data'],
  ['text', '3. Create a model which will predict whether a passenger survived using only the Train data set'],
  ['text', '4. Submit the prediction to the leaderboard'],
  ['text', 'Opetionally you can bolster the basic model with stronger parameters and any other method you can come up with.'],
  ['text', 'Try to get to the top of the leaderboard!'],
]

project = Project.create!(
  title: "Kaggle New Proj Approach",
  description: main_page_load,
  short_description: "This is the new titanic project",
  number: 11,
  enabled: true,
  has_leaderboard: true,
  has_submit: true,
  uid: 11,
  difficulty: 'Intermediate',
)
################################################################################

puts "============ Created project: #{project.title}."

new_tatanic_intro_content_one = [
  ['text', 'Welcome to Titanic!'],
  ['text', 'This project is based off of the historic sinking of the Titanic; you are asked to build a model which predicts which passengers survived!'],
  ['text', 'We\'ll be guiding you through a series of analysis stages.'],
  ['text', 'As you complete the steps, paste in your code and responses!'],
]

new_tatanic_intro_content_two = [
  ['text', 'Download the "Train" dataset here:'],
  ['link', 'http://leada.s3.amazonaws.com/titanic_data/train.csv'],
  ['text', 'Download the "Test" dataset here:'],
  ['link', 'http://leada.s3.amazonaws.com/titanic_data/test.csv'],
  ['text', 'You\'ll be predicting how many individuals from the "Test" dataset survived. To give you a sense for the submission, download this file and submit it for grading! In the file, we simply predict that all of the males died and all of the females survived.'],
  ['link' , 'https://s3.amazonaws.com/leada/titanic_data/FirstSubmission.csv'],
  ['submit', nil],
  ['next_steps', nil],
]

welcome_lesson = Lesson.create!(
  title: "Titanic New Welcome",
  project: project,
  lesson_id: 0,
)

welcome_lesson_slide_one = Slide.create!(
  content: welcome_lesson_slide_one_content,
  parent: welcome_lesson,
  slide_id: 0,
)

################################################################################








