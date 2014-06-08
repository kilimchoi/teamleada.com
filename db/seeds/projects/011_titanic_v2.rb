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
  ['text', 'Try to keep your responses to be as concise as possible.'],
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
  ['text', 'Now that we have the data, let\' build some Vizualizations.'],
  ['text', 'Our intuition might be that the women had a higher chance of survival, because the boat might have adhered to the "Women and Children First" standard.'],
  ['text', 'What Vizualization would help us check this assumption? Write the code and paste it below:'],
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
train_clean_content_one = [
  ['text', 'Now let\'s see if we need to do any cleaning.'],
  ['text', 'What do you notice about the data that might need cleaning/correcting? How do you plan on correcting them?'],
  ['user_response', '#@TODO probabl a UID here.'],
  ['text', 'Write the code that does the cleaning.'],
  ['user_code', '#@TODO probabl a UID here'],
  ['text', 'Do you have any afterthoughts on the cleaning you did?'],
  ['user_response', '#@TODO probabl a UID here'],
  ['next_steps', nil]
]

train_clean_step = Step.create!(
  title: "Clean Titanic Train Data",
  previous_step: train_data_step,
  step_id: 2,
)

train_clean_slide_one = Slide.create!(
  content: train_clean_content_one,
  parent: train_clean_step,
  slide_id: 0,
)

################################################################################

test_data_content = [
  ['text', 'Now we will do the same analysis to the testData.'],
  ['text', 'Paste below the code you used to lightly explore the data.'],
  ['user_code', '#@TODO probabl a UID here'],
  ['next_steps', nil],
]

test_data_step = Step.create!(
  title: "Titanic Test Data",
  lesson: work_with_data_lesson,
  step_id: 3,
)

test_data_slide_one = Slide.create!(
  content: test_data_content,
  parent: test_data_step,
  slide_id: 0,
)

test_data_step.add_required_steps([train_visualize_step, train_clean_step])
################################################################################

test_visualize_content = [
  ['text', 'Visualizing the "Test" dataset is important because you want to make sure that the two datasets are consistent with each other.'],
  ['text', 'Otherwise when building a model on the "Train" dataset, you\'re creating a model on the old data which has no resemblance with new data.'],
  ['text', 'Such scenario occurs in production and can lead to poor real-time performance.'],
  ['text', 'Now create some vizualizations to see if the Test data looks similar to the Train Data.'],
  ['user_code', '#@TODO probabl a UID here'],
  ['text', 'What vizualization(s) did you build? Why did you build it?'],
  ['user_response', '#@TODO probabl a UID here'],
  ['next_steps', nil]
]

test_visualize_step = Step.create!(
  title:"Visualize Titanic Test Data",
  previous_step: test_data_step,
  step_id: 4,
)

test_visualize_slide_one = Slide.create!(
  content: test_visualize_content,
  parent: test_visualize_step,
  slide_id: 0,
)
################################################################################

test_clean_one_content = [
  ['text', 'Now clean the testData the same way we cleaned the Train Data.'],
  ['user_code', '#@TODO probabl a UID here'],
  ['next_steps', nil],
]

test_clean = Step.create!(
  title: "Clean Titanic Test Data",
  previous_step: test_data_step,
  step_id: 5,
)

test_clean_slide_one = Slide.create!(
  content: test_clean_one_content,
  parent: test_clean,
  slide_id: 0,
)
################################################################################
# Analytics
analytics_tools_one_content = [
  ['text', 'In this section we\'ll build the actual model to make predictions.'],
  ['text', 'You\'ll get to choose the model you want to fit.'],
  ['lesson_links', nil],
]

analytics_tools_lesson = Lesson.create!(
  title: "Titanic Analytics Tools",
  project: project,
  lesson_id: 2,
)

analytics_slide_one = Slide.create!(
  content: analytics_tools_one_content,
  parent: analytics_tools_lesson,
  slide_id: 0,
)
################################################################################

learn_ctree_one_content = [
  ['text', 'What model do you plan on building?'],
  ['user_response', '#@TODO Include UID'],
  ['text', 'Why did you choose this model?'],
  ['user_response', '#@TODO Include UID'],
]

learn_ctree_two_content = [
  ['text', 'What are some of the variables that you\'re going to use?'],
  ['user_response', '#@TODO Include UID'],
  ['text', 'How will you choose them?'],
  ['user_response', '#@TODO Include UID'],
  ['next_steps', nil],
]

learn_ctree = Step.create!(
  title: "Model Building Plan",
  lesson: analytics_tools_lesson,
  step_id: 0,
)

learn_ctree_slide_one = Slide.create!(
  content: learn_ctree_one_content,
  parent: learn_ctree,
  slide_id: 0,
)

learn_ctree_slide_two = Slide.create!(
  content: learn_ctree_two_content,
  parent: learn_ctree,
  slide_id: 1,
)
################################################################################

apply_ctree_one_content = [
  ['text', 'Now let\'s actually build the model. Paste your code below:'],
  ['user_code', '#@TODO Include UID'],
  ['text', 'What did you do the evaluate the model?'],
  ['user_response', '#@TODO Include UID'],
  ['text', 'Don\'t forget to make a submission! If you need help, checkout the submission help section.'],
  ['next_steps', nil],
]

apply_ctree = Step.create!(
  title: "Apply the Model",
  lesson: analytics_tools_lesson,
  step_id: 1,
)

apply_ctree_slide_one = Slide.create!(
  content: apply_ctree_one_content,
  parent: apply_ctree,
  slide_id: 0,
)

################################################################################

submission_guide_content = [
  ['text', 'Remember that the file you submit to Leada must be a CSV file!'],
  ['text', 'You also want to make sure that your submission file is of the following format:'],
  ['text', 'Has exactly two columns titled "PassengerId" and "Prediction"'],
  ['text', 'Has the correct type of data and has no missing values'],
  ['text', 'It should be in the exact same format as the first file you submitted which you can again see below'],
  ['link', 'https://s3.amazonaws.com/leada/titanic_data/FirstSubmission'],
  ['next_steps', nil],
]

submission_guide_lesson = Lesson.create!(
  title: "Titanic Submission Help",
  project: project,
  lesson_id: 3,
)

submission_guide_slide = Slide.create!(
  content: submission_guide_content,
  parent: submission_guide_lesson,
  slide_id: 0,
)

################################################################################
increase_score_one_content = [
  ['text', 'Now that you have created a predictive model, work on improving it!'],
  ['text', 'How do you think you can improve the model?'],
  ['user_response', '#@TODO Include UID'],
  ['text', 'If you did try increasing your score, paste in the relevant snippet here:'],
  ['user_code', '#@TODO Include UID'],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

increase_score_lesson = Lesson.create!(
  title: "Increase Your Score",
  project: project,
  lesson_id: 4,
)

increate_score_slide_one = Slide.create!(
  content: increase_score_one_content,
  parent: increase_score_lesson,
  slide_id: 0,
)

################################################################################










