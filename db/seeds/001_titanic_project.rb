# Creates the first project on the site!


project = Project.create!(
  title: "Kaggle Titanic: Machine Learning From Disaster",
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
  ['text', '- Built a classification tree model which predicts which passengers of the Titanic crash survived'],
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
  ['text', 'To begin we need to install the tools for data analysis! R is a useful and free application for data analytics that is widely used around the world. RStudio provides a more user friendly interface to work in!'],
  ['text', 'Mac users download and install named "R-3.0.3.pkg (latest version)"'],
  ['text', 'Windows users download and install R named "Download R 3.0.3 for Windows"'],
  ['text', 'Make sure to choose the appropriate RStudio file'],
  ['text','Download at https://www.rstudio.com/ide/download/desktop'],
  ['text', 'Now create a folder on your desktop titled "Kaggle" and download the two data files at this link, save them in this Kaggle folder'],
  ['text', 'In RStudio we must create a file for us to write in. Go to File ==> New ==> Rscript. Now in that file we must tell R where our current working directory is. We do this by using the setwd() function. Your working directory indicates to R which folder to look for the datasets you want to use. '],
  ['text', 'Your working directory location is unique to each user! We provide an example of the format your code should be in'],
  ['text', 'For Mac Users it should look like: setwd("/Users/your_user_name/Desktop/kaggle/")'],
  ['text', 'For Windows Users it should look like: setwd("C:/Users/your_user_name/Desktop/kaggle")'],
  ['text', 'You can look at this image as an example. The correct code would be: setwd("/Users/Clair/Desktop/kaggle/")'],
  ['image', 'set_cwd().png']
  ['text', 'To run what you just wrote in your RScript, put your cursor on a line of code in your RScript and enter control and return at the same time! Congrats you’ve just run your first line of R code!'],
  ['text', 'From now on you can run any of our code snippets by copy and pasting it into your own RScript, and entering control and return. Typing control and return anywhere on the line runs the entire line of RCode.'],
  ['text', 'Now we utilize the read.csv() function to load the data into R.'],
  ['code', 'trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)'],
  ['code', 'testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)'],
  ['text', 'Then we take the sex of each passenger in the Test dataset and convert them to survived or died. 1 means they survived, 0 means they died'],
  ['code', 'Survived <- as.numeric(factor(testData$Sex, levels = c("male","female"), labels = c(0,1))) - 1'],
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


main_page_content = [
  ['text', 'This is the main page for your first data project! Choose from the options below to begin your training as a data guru and you will find yourself learning the process along the way.'],
  ['text', 'You are tasked to predict whether a passenger survived the Titanic crash. You are given two datasets (Train & Test) each of which include predictor variables such as Age, Passenger Class, Sex, etc. With these two data sets we will do the following:'],
  ['text', '1. Create a model which will predict whether a passenger survived using only the Train data set'],
  ['text', '2. Predict whether the passengers survived in the Test data set based on the model we created'],
]

main_page = Lesson.create!(
  title: "Main Page",
  content: main_page_content,
  project: project
)

work_with_data_content = [
  ['text', 'In this project you are given two datasets "Train" and "Test". You will be using the "Train" dataset to build your model. This model will create predictions for passenger survival for the "Train" dataset.'],
  ['text', 'In analytics we call this "training the model", hence the name "Train" for the dataset. Then, using the model you built you will predict whether the passengers in the "Test" dataset survived based on the model you created, hence the name "Test" for the other dataset!'],
]

work_with_data_lesson = Lesson.create!(
  title: "Work with the Data",
  content: work_with_data_content,
  project: project
)


train_data_content = [
  ['text', 'To take a look at the first six rows of the "Train" dataset use the following function'],
  ['code', 'head(trainData)'],
  ['text', 'To take a look at the last six rows of the dataset use'],
  ['code', 'tail(trainData)'],
  ['text', 'If you want to look at the entire dataset just type'],
  ['code', 'trainData'],
  ['text', 'The first thing you want to understand when beginning to dive into the data is what do the columns represent. Most are self-explanatory but a couple are a little confusing. "SibSp" is the total number of siblings or spouses that a passenger has on the Titanic.'],
  ['text', '"Parch" is the number of parents or children that a passenger has on the Titanic. "Pclass" is the passenger class (1st, 2nd, 3rd) "Embarked" is the location the passenger embarked from (Cherbourg, Queenstown, Southampton)'],
]

train_data = Step.create!(title: "Train Data", content: train_data_content, lesson: work_with_data_lesson)

train_visualize_content = [
  ['text', 'It is good to first visualize the data to get a general understanding of the patterns and trends of the data. Lets look at the survival rate of our passengers filtered by Sex.'],
  ['text', 'Your intuition might be that the women had a higher chance of survival because the boat adhered to the "Women and Children First" standard. We first create a table and call it "counts". Then we use the barplot() function in R.'],
  ['code', 'counts <- table(trainData$Survived, trainData$Sex)'],
  ['code', 'barplot(counts, xlab = "Gender", ylab = "Number of People", main = "Survival by Sex")'],
  ['code', 'counts[2] / (counts[1] + counts[2])'],
  ['code', 'counts[4] / (counts[3] + counts[4])'],
  ['text', 'The lighter areas indicate survival and notice that our intuition was correct! 74.2% of women survived vs. 18.9% of men. We can use this to improve our model.'],
]

train_visualize = Step.create!(title:"Visualize", content: train_visualize_content, previous_step: train_data)

train_clean_content = [
  ['text', 'Cleaning data is typically one of the most time consuming parts to data analysis. We will cover a major topic in cleaning which is what to do with missing values.'],
  ['text', 'If you noticed, there are several missing values for the "Age" variable for our observations. You can see by coding the following:'],
  ['code', 'trainData$Age'],
  ['text', 'Notice how there are tons of NA\'s. Filling in these NA\'s can improve our model so we will make inferences on the missing age variables. A simple proxy is the average age of all of the passengers. '],
  ['text', 'We write a for loop which goes through each row of our "Train" dataset and if the Age column is "NA" then we input the average age.'],
  ['text', 'We first calculate the mean age and ignore the NAs'],
  ['code', 'mean_age <- round(mean(trainData$Age,na.rm=T), digits = 3)'],
  ['text', 'Then we loop through the observations in the dataset and add the average age accordingly'],
  #Fix Newline Character spacing for code
  ['code', 'for (i in 1:nrow(trainData)) {\n\tif (is.na(trainData[i,6])) {\n\t\ttrainData$Age[i] <- mean_age\n\t}\n}'],
]

train_clean = Step.create!(title:"Clean", content: train_clean_content, previous_step: train_data)

test_data_content = [
  ['text', 'We can use the same functions as we did before to look at our "Test" dataset If you want to see more than 6 rows you can do'],
  ['code', 'head(testData, 10)'],
  ['code', 'tail(testData, 10)'],
  ['code', 'testData'],
]

test_data = Step.create!(title:"Test Data", content: test_data_content, lesson: work_with_data_lesson)
test_data.add_required_steps([train_visualize, train_clean])

test_visualize_content = [
  ['text', 'Visualizing the "Test" dataset is important because you want to make sure that the two datasets are at least somewhat consistent with each other.'],
  ['text', 'Otherwise when building a model on the "Train" dataset your creating a model for new data that has no similarity with the old data and will result in poor predictions!'],
  ['text', 'Simple checks such as creating density plots will suffice for now'],
  ['code', 'plot(density(testData$Age, na.rm = TRUE), main ="TestData Age Density")'],
  ['code', 'plot(density(trainData$Age, na.rm = TRUE), main ="TrainData Age Density")'],
  ['text', 'Density plots check the distribution of a variable, a distribution is the probability of being any given value in a variable. In this case its the probability of being any given age based on the datasets.'],
  ['text', 'You should see that these distributions are approximately similar. Its good to check more of the variables but we will move on.'],
]

test_visualize = Step.create!(title:"Visualize", content: test_visualize_content, previous_step: test_data)


test_clean_content = [
  ['text', 'This is the same situation as the "Train" dataset. We want to make inferences on the missing age variables to strengthen our model'],
  ['text', 'We calculate the mean age of the "Test" dataset'],
  ['code', 'test_mean_age <- round(mean(testData$Age, na.rm= T), digits = 3)'],
  ['text', 'We loop through each observation and input the mean age when necessary'],
  ['code', 'for (i in 1:nrow(testData)) {\n\tif (is.na(testData[i,5])) {\n\t\ttestData[i, 5] <- test_mean_age\n\t}\n}'],
]


test_clean = Step.create!(title: "Clean", content: test_clean_content, previous_step: test_data)

analytics_tools_content = [
  ['text', 'In this first project we will cover one of the most effective and simple predictive analytics tools for data analytics, classification trees.'],
  ['text', 'In future projects you will learn a variety of tools and specifically when to apply them. Logistic regression, Support Vector Machines, and many more!'],
]

analytics_tools_lesson = Lesson.create!(
  title: "Analytics Tools",
  content: analytics_tools_content,
  project: project
)

learn_ctree_content = [
  #Include image of C-tree
  ['text', 'A classification tree is made up of interior and terminal nodes and is structured upside down so the root node is at the top and branches downwards'],
  ['image', 'classification_tree.jpg']
  ['text', 'In the example tree, the nodes represent the how your data is segmented so at the top it begins by first separating the data by Sex.'],
  ['text', 'Subsequent nodes further segment the data, for example one node is Age greater than or equal to 6.5 below the male node and results in a 0. This means that the model will classify all male observations with age greater than 6.5 as dying in the Titanic'],
  ['text', 'What one needs to be careful of when using classification trees is the concept of "overfitting" your data. Classification tree models are very susceptible to overfiting and is one of their disadvantages for use.'],
  ['text', 'In general, overfitting is when you find patterns in the data that does not generalize to new datasets. If you look hard enough, you can find patterns in any dataset.'],
  ['text', 'There are two main advantages to building a classification tree model. (1) They require very little data preparationi and cleaning. (2) Classification models are easy to interpret and explain to others!'],
]

learn_ctree = Step.create!(title: "Learn Classification Trees", content: learn_ctree_content, lesson: analytics_tools_lesson)

apply_ctree_content = [
  ['text', 'To create a classification tree model we use the function rpart() in R. The arguments in the formula are as follows:\nrpart(formula, data, method, control)\nformula = the independent (Survived) and dependent variables (Age, Pclass, etc.)\ndata = dataset object (trainData or testData)\nmethod = the type of classification tree you are using ("class")\ncontrol = limits the number of splits and complexity to prevent overfitting'],
  ['text', 'Take a look again at the columns of the "Train" dataset'],
  ['code', 'head(trainData, 1)'],
  ['text', 'Remember that we are trying to predict whether each passenger "Survived" (independent variable) and we have the following features to use: "PassengerId", "Pclass", "Name", "Sex", "Age", "SibSp", "Parch", "Ticket", "Fare", "Cabin", "Embarked" (dependent variables)'],
  ['text', 'For our first model we only use "Pclass", "Sex", and "Age" to predict "Survived". '],
  ['text', 'First we need to install a package in R'],
  ['code', 'library(\'rpart\')'],
  ['text', 'We create our model and name it "tree_model"'],
  ['code', 'tree_model <- rpart(Survived ~ Pclass + Sex + Age, data = trainData, method = "class")'],
  ['text', 'We plot the model and label the nodes'],
  ['code', 'plot(tree_model)'],
  ['code', 'text(tree_model)'],
  ['text', 'Now that we have our model built using the "Train" dataset, we can apply our model to the "Test" dataset to make predictions for those passengers! What is done here is the nodes used to classify the passengers in the "Train" dataset such as "Age >= 6.5" are now applied to the passengers in the "Test" dataset to predict their survival.'],
  ['text', 'R again has a convenient function predict() to allow us to apply our tree_model to the testData'],
  ['code', 'test_predictions <- round(predict(tree_model, newdata = testData)[, 2], 0)'],
  ['text', 'We match our predictions with the appropriate PassengerId'],
  ['code', 'model_submission <- cbind(testData$PassengerId, test_predictions)'],
  ['text', 'We rename the columns for clarity'],
  ['code', 'colnames(model_submission) <- c("PassengerId", "Prediction")'],
  ['text', 'We use the write.csv() function to convert our data frame in R into a CSV file'],
  ['code', 'write.csv(model_submission, "mysubmission.csv", row.names = FALSE)'],
  ['text', 'And now you can submit this file to the submission page and see where you rank on the LeadaBoard! Go to the "Increase your Score" page to learn ways to move up on the LeadaBoard and strengthen your model!'],
]

apply_ctree = Step.create!(title: "Apply a Classification Tree Model", content: apply_ctree_content, lesson: analytics_tools_lesson)


increase_score_content = [
  ['text', 'As you can see building these models is relatively easy! Creating accurate models however are another story. Here we will introduce the most critical skill to analyzing data. Curiousity. '],
  ['text', 'Don\'t believe us? Believe it. Knowing what data you want and can create by asking the right questions is the skill that differentiates data analysis results from the rest. This is best done by having a curiousity with the data, digging into it thoroughly, and thinking creatively.'],
  ['text', 'For example remember back to our discovery that women were much more likely to survive than men? We determined that through the assumption the passengers adhered to "women and children first" standard. Since we have the age of our passengers, why don\'t we create a variable which also identifies children?'],
  ['text', 'Creates a new column titled "Child"'],
  ['code', 'trainData["Child"] <- NA'],
  ['text', 'This for loop loops through each row in "Train" dataset and checks in the age column if it is less than 18. If the age is less than 18, we put a 1 in the "Child" column and if it is greater than 18 we put a 2 in the column.'],
  ['code', 'for (i in 1:nrow(trainData)) {\n\tif (trainData$Age[i] <= 18) {\n\t\ttrainData$Child[i] <- 1\n\t} else {\n\t\ttrainData$Child[i] <- 2\n\t}\n}'],
  ['text', 'Just remember that whatever variable you create in your "Train" dataset you must also create in your "Test" dataset for your model to function correctly!'],
  ['code', 'testData["Child"] <- NA'],
  ['code', 'for (i in 1:nrow(testData)) {\n\tif (testData[i, 4] <= 18) {\n\t\ttestData[i, 7] <- 1\n\t} else {\n\t\ttestData[i, 7] <- 2\n\t}\n}'],
  ['text', 'Another possible variable could be "Family Size". Maybe the larger of a family you had the less likely you were to survive.'],
  ['code', 'trainData["Family"] <- NA'],
  ['text', 'We sum the number in "SibSp" and "Parch" and add one to include the passenger'],
  ['code', 'for(i in 1:nrow(trainData)) {\n\tx <- trainData$SibSp[i]\n\ty <- trainData$Parch[i]\n\ttrainData$Family[i] <- x + y + 1\n}'],
  ['text', 'Again don\'t forget to create this also in the "Test" dataset! Your going to have to try on your own!'],
  ['text', 'With these new variables and including the ones we didn\'t use, you should be able to significantly increase your score! To add more dependent variables to your model just include the column name and R should do the rest!'],
  ['text', 'Here is an example of the code for a classification tree model if we included the "Fare" variable'],
  ['code', 'tree_model_two <- rpart(Survived ~ Pclass + Sex + Age + Fare, data = trainData, method = "class")'],
]

increase_score_lesson = Lesson.create!(
  title: "Increase Your Score",
  content: increase_score_content,
  project: project
)

# Leaderboard Seed info
mark = User.find_by(username: 'mark')
brian = User.find_by(username: 'brian')
tristan = User.find_by(username: 'tristan')

Submission.create!(project: project, user: mark, score: 0.999)
Submission.create!(project: project, user: brian, score: 0.01)
Submission.create!(project: project, user: tristan, score: 0.001)
