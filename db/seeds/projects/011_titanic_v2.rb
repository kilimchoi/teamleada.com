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
  ['text', 'Next, we\'ll get you setup with downloading the data.'],
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
  content: new_tatanic_intro_content_one,
  parent: welcome_lesson,
  slide_id: 0,
)

welcome_lesson_slide_two = Slide.create!(
  content: new_tatanic_intro_content_two,
  parent: welcome_lesson,
  slide_id: 1,
)
################################################################################

work_with_data_content = [
  ['text', 'In this project you are given two datasets "Train" and "Test". You will be using the "Train" dataset to build your model. This model will create predictions for passenger survival for the "Train" dataset.'],
  ['text', 'In analytics we call this "training the model", hence the name "Train" for the dataset. Then, using the model you built you will predict whether the passengers in the "Test" dataset survived based on the model you created, hence the name "Test" for the other dataset!'],
  ['lesson_links', nil],
]

work_with_data_lesson = Lesson.create!(
  title: "Work with the Raw Data",
  project: project,
  lesson_id: 1,
)

work_with_data_slide_one = Slide.create!(
  content: work_with_data_content,
  parent: work_with_data_lesson,
  slide_id: 0,
)

################################################################################
train_data_content = [
  ['text', 'To begin working with the data we need to read in the data into R.'],
  ['text', 'Accomplish the following and paste the corresponding code.'],
  ['text', '- Separately load the train and test data via read.csv(). Name the raw loaded data "trainData" and "testData"'],
  ['text', '- Print the first few rows (and/or the last few rows) of the data.'],
  ['text', 'Paste the code you wrote to accomplish the tasks:'],
  ['user_code', '#@TODO probabl a UID here'],
  ['text', 'Do you have any thoughts on the data?'],
  ['user_response', '#@TODO probabl a UID here'],
  ['next_steps', nil]
]

train_data_step = Step.create!(
  title: "Titanic Train Data",
  lesson: work_with_data_lesson,
  step_id: 0,
)

train_data_slide_one = Slide.create!(
  content: train_data_content,
  parent: train_data_step,
  slide_id: 0,
)

################################################################################

train_visualize_content = [
  ['text', 'Now that we have the data, let\' build some Vizualizations'],
  ['text', 'Our intuition might be that the women had a higher chance of survival, because the boat adhered to the "Women and Children First" standard.'],
  ['text', 'What Vizualization would help us check this assumption? Paste your code below: '],
  ['user_code', '#@TODO probabl a UID here'],
  ['text', 'What vizualization(s) did you build? Why? What do you see?'],
  ['user_response', '#@TODO probabl a UID here'],
  ['next_steps', nil],
]

train_visualize_step = Step.create!(
  title: "Visualize Titanic Train Data",
  previous_step: train_data_step,
  step_id: 1,
)

train_visualize_slide_one = Slide.create!(
  content: train_visualize_content,
  parent: train_visualize_step,
  slide_id: 0,
)

################################################################################
train_visualize_content = [
  ['text', 'It is good to first visualize the data to get a general understanding of the patterns and trends of the data. Lets look at the survival rate of our passengers filtered by Sex.'],
  ['text', 'Your intuition might be that the women had a higher chance of survival because the boat adhered to the "Women and Children First" standard. We first create a table and call it "counts". Then we use the barplot() function in R.'],
  ['code', 'counts <- table(trainData$Survived, trainData$Sex)'],
  ['code', 'barplot(counts, xlab = "Gender", ylab = "Number of People", main = "Survival by Sex")'],
  ['code', 'counts[2] / (counts[1] + counts[2])'],
  ['code', 'counts[4] / (counts[3] + counts[4])'],
  ['text', 'The lighter areas indicate survival and notice that our intuition was correct! 74.2% of women survived vs. 18.9% of men. We can use this to improve our model.'],
  ['next_steps', nil]
]

train_visualize_step = Step.create!(
  title: "Visualize Train Data",
  previous_step: train_data_step,
  step_id: 1,
)

train_visualize_slide_one = Slide.create!(
  content: train_visualize_content,
  parent: train_visualize_step,
  slide_id: 0,
)
################################################################################












