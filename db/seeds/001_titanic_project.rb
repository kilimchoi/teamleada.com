# Creates the first project on the site!

project = Project.create!(
  title: "Titanic: Machine Learning From Disaster",
  description: "This is a description of the project",
  number: 1,
  enabled: true
)

puts "Created project: #{project.title}."

welcome_lesson_content = [
  ['text', 'Welcome to your first Data Project by Leada! This project is taken from Kaggle, a data science competition website and is an excellent introduction into the work of data analytics! Check them out at www.kaggle.com'],
  ['text', 'This project is based off of the historic sinking of the Titanic and you are asked to build a model which predicts which passengers survived! Complete this project and you will have:'],
  ['text', '- Learned how to do exploratory analysis on data and create visualizations'],
  ['text', '- Learned how to clean data and make inferences on missing data'],
  ['text', '- Built a classification tree model which predicts which survivors of the Titanic crash survived'],
  ['text', '- Learned how to use your model to predict whether new passengers survived'],
  ['text', 'You will learn all of these things coding in R! Don\'t worry if you\'ve never use R before, we will walk you through every part of the way!'],
  ['text', 'All of the learning principles here are fundamental skills for data analysts/data scientists and for anyone who wants to learn how to answer questions from data. So lets begin!'],
]

welcome_lesson = Lesson.create!(
  title: "Welcome",
  content: welcome_lesson_content,
  project: project
)

quick_pass_content = [
  ['text', 'In this project you are given two datasets "Train" and "Test". You will be using the "Train" dataset to build your model. This model will create predictions for passenger survival for the "Train" dataset.'],
  ['text', 'In analytics we call this "training the model", hence the name "Train" for the dataset. Then, using the model you built you will predict whether the passengers in the "Test" dataset survived based on the model you created, hence the name "Test" for the other dataset!'],
  ['text', 'There are 418 passengers we need to predict in the "Test" dataset, 266 were male and 152 were female. Lets first just guess that the men survived and the women died. Don\'t worry about the details of the Rcode we provide for now, we will explain it all later!'],
  ['text', 'First we utilize the read.csv() function to load the data into R.'],
  ['code', 'trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)'],
  ['code', 'testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)'],
  ['text', 'Then we take the sex of each passenger in the Test dataset and convert them to survived or died. 1 means they survived, 0 means they died'],
  ['code', 'Survived <- factor(testData$Sex, labels = c(1, 0))'],
  ['text', 'We select the passengerID of each passenger and match it with our prediction for survival'],
  ['code', 'submission_file <- cbind(testData$PassengerId, Survived)'],
  ['text', 'We rename the columns'],
  ['code', 'colnames(submission_file) <- c("PassengerId", "Survived")'],
  ['text', 'We create the file!'],
  ['code', 'write.csv(submission_file, file = "FirstSubmission", row.names = FALSE)'],
  ['text', 'Prompt them to create a name for their submission'],
  ['text', 'Hmmm not too high! Well continue on to the project to improve your score'],
]

quick_pass = Step.create!(title: "Quick Pass", content: quick_pass_content, lesson: welcome_lesson)







=begin
work_with_data_content = "Notice that you are given two datasets [Train/Test]! We will disect and vizualize data, and eventually clean them.

In general Data Scientists build models using cleaned Training data and then make predictions utilizing cleaned Test data.
"
learn_and_apply_content = "Welcome to the Tools Screen. There are many models that can be applied to this data project, but we will only go over two: generalized linear models (GLM) and Classification Trees (CT).
"

work_with_data = Step.create!(title: "Work with the data", content: work_with_data_content, lesson: welcome_lesson)
learn_and_apply = Step.create!(title: "Learn and apply Analytics tools here", content: learn_and_apply_content, lesson: welcome_lesson)

# Work with Data
training_data_content = "This is the place where you work with training data. You can view, vizualize, and eventually modify the data."
training_data = Step.create!(title: "Work with the training data", content: training_data_content, previous_step: work_with_data)

testing_data_content = "This is the place where you work with testing data. You can view, vizualize, and eventually modify the data."
testing_data = Step.create!(title: "Work with the testing data", content: testing_data_content, previous_step: work_with_data)

# Training Data
view_training_data_content = "This is where you'll load the data, and get your first glimpse."
view_training_data = Step.create!(title: "View the training data", content: view_training_data_content, previous_step: training_data)

visualize_training_data_content = ""
visualize_training_data = Step.create!(title: "Visualize the training data", content: visualize_training_data_content, previous_step: training_data)

manipulate_training_data_content = ""
manipulate_training_data = Step.create!(title: "Manipulate the training data", content: manipulate_training_data_content, previous_step: training_data)

# Testing Data
view_testing_data_content = ""
view_testing_data = Step.create!(title: "View the testing data", content: view_testing_data_content, previous_step: testing_data)

visualize_testing_data_content = ""
visualize_testing_data = Step.create!(title: "Visualize the testing data", content: visualize_training_data_content, previous_step: testing_data)

manipulate_testing_data_content = ""
manipulate_testing_data = Step.create!(title: "Manipulate the testing data", content: manipulate_training_data_content, previous_step: testing_data)

# Second Lesson
view_and_explore_data_content = 'Here, you learn how to inspect the data. In R, we utilize the following function to achieve that goal:

Taking a brief look at the data first is always a good move to get yourself familiarized. The first thing we want to do is put the datasets you downloaded from Kaggle into RStudio! Write the following code to "read in" your data into RStudio:

trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)
'
view_and_explore_data = Lesson.create!(
  title: "This is where you view and explore the data!",
  content: view_and_explore_data_content,
  project: project
)
=end

# Leaderboard Seed info
mark = User.find_by(username: 'mark')
brian = User.find_by(username: 'brian')
tristan = User.find_by(username: 'tristan')

Submission.create!(project: project, user: mark, score: 0.999)
Submission.create!(project: project, user: brian, score: 0.01)
Submission.create!(project: project, user: tristan, score: 0.001)
