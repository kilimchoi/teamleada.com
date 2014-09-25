main_page_content = [
  ['text', 'This bootcamp will introduce and explain three topics which will be utilized in the Titanic: Machine Learning from Disaster data project created by Kaggle.'],
  ['text', '- Data manipulation in R'],
  ['text', '- Creating visualizations in R'],
  ['text', '- Programming in R'],
  ['text-success', "Let's get started!"],
]

project = Project.create!(
  title: "Kaggle Titanic Bootcamp",
  description: main_page_content,
  short_description: "In this bootcamp you will be introduced to the R programming concepts necessary to fully understand the Titanic: Machine Learning from Disaster data project.",
  number: 5,
  enabled: true,
  has_leaderboard: false,
  uid: 5,
  difficulty: 'Beginner',
  category: Project::LESSON,
  is_new: false,
  cover_photo: "titanic-bootcamp",
)


################################################################################
puts "============ Created project: #{project.title}."
################################################################################


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

manipulate_data_content = [
  ['text', 'To teach data manipulation concepts, we will work with a preloaded dataset "ChickWeight" in R.'],
  ['text', 'First familiarize yourself with the data by outputting it and reading about it in the help section.'],
  ['text-success', 'To look at the raw data:'],
  ['code', 'ChickWeight'],
  ['text-success', 'To access information about the dataset:'],
  ['code', 'help(ChickWeight)'],
  ['lesson_links', nil],
]


manipulate_lesson = Lesson.create!(
  title: "Manipulating Data in R",
  project: project,
  lesson_id: 0,
)

manipulate_slide = Slide.create!(
  content: manipulate_data_content,
  parent: manipulate_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

view_data_content = [
  ['text-info', 'Lets first determine what data type the ChickWeight dataset is in R.'],
  ['text', 'It looks to be in the standard data frame form, but to verify try the following:'],
  ['code', 'is.data.frame(ChickWeight)'],
  ['text', 'To see how many columns or rows the ChickWeight data frame has, we can use the following functions:'],
  ['code', 'nrow(ChickWeight)'],
  ['code', 'ncol(ChickWeight)'],
  ['text', 'If you want to look at the first six rows of the data frame you can use the head() function:'],
  ['code', 'head(ChickWeight)'],
  ['quiz', 't_bootcamp_1'],
]

view_data_content_two = [
  ['text', 'You can also see the last six rows by using the tail() function:'],
  ['code', 'tail(ChickWeight)'],
  ['text', 'To list the names of the columns in the data frame enter:'],
  ['code', 'colnames(ChickWeight)'],
  ['text', 'If you want to select individual columns of a data frame you use the "$" followed by the title of the column you want to select:'],
  ['code', 'ChickWeight$weight'],
  ['next_steps', nil],
]

view_data_step = Step.create!(
  title: "Viewing Data in R",
  lesson: manipulate_lesson,
  step_id: 0,
)

view_data_slide = Slide.create!(
  content: view_data_content,
  parent: view_data_step,
  slide_id: 0,
)

view_data_slide_two = Slide.create!(
  content: view_data_content_two,
  parent: view_data_step,
  slide_id: 1,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "t_bootcamp_1",
  answer:"93",
  project: project,
  slide: view_data_slide,
  question: 'What is the weight of the sixth chick?',
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


index_data_content = [
  ['text-info', 'You can index by position in three ways.'],
  ['text-success', 'The 1st way is in "matrix" format. You can select by [row,column] from the ChickWeight data frame:'],
  ['code', 'ChickWeight[1,1]'],
  ['text-success', 'Secondly, you can also index individual columns by using the "$" and then index in vector format. Here we select the 5th value from the weight column in the ChickWeight dataset'],
  ['code', 'ChickWeight$weight[5]'],
  ['text', 'If we wanted to grab a range of values in the weight column we index by a vector of values'],
  ['code', 'ChickWeight$weight[c(1:5)]'],
  ['text-success', 'Lastly you can index a dataset by logical comparisons. Here we select all of the weights which are greater than 70.'],
  ['code', 'ChickWeight$weight[ChickWeight$weight > 70]'],
]

index_data_content_two = [
  ['text-info', 'If we want to index and return the entire dataset we can again use the same [row, column] format.'],
  ['text', 'We index the entire data frame by selecting all rows where the weight is greater than 70.'],
  ['code', 'data_with_weight_greater_than_ten = ChickWeight[ChickWeight$weight > 70, ]'],
  ['text', 'We assign this newly indexed data frame to the variable name data_with_weight_greater_than_ten.'],
  ['text', 'To view it use the head() function.'],
  ['code', 'head(data_with_weight_greater_than_ten)'],
  ['next_steps', nil],
]


index_data_step = Step.create!(
  title: "Indexing Data in R",
  lesson: manipulate_lesson,
  step_id: 1,

)

index_slide = Slide.create!(
  content: index_data_content,
  parent: index_data_step,
  slide_id: 0,

)

index_slide_two = Slide.create!(
  content: index_data_content_two,
  parent: index_data_step,
  slide_id: 1,

)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


visualize_bootcamp_content = [
  ['text-info', 'R has tons of extra resources for making complex visualizations.'],
  ['text', 'In this bootcamp we will introduce a couple of the most basic ones.'],
  ['text', 'R\'s powerful visualization tools are one of its biggest advantages.'],
  ['text', 'Be sure to do your own research on how to create beautiful graphics.'],
  ['lesson_links', nil]
]


visualize_lesson = Lesson.create!(
  title: "Basic Visualizations",
  project: project,
  lesson_id: 1,
)

visualize_bootcamp_slide = Slide.create!(
  content: visualize_bootcamp_content,
  parent: visualize_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

barplot_bootcamp_content = [
  ['text-info', 'To make a barplot we will first utilize the table() function in R.'],
  ['text', 'The table() function calculates frequencies for a given variable.'],
  ['text', 'For example, let\'s determine the frequency of the Diets in the ChickWeight dataset:'],
  ['code', 'diet_freq = table(ChickWeight$Diet)'],
  ['quiz', 't_bootcamp_2'],
  ['text', 'If we wanted to see the frequency by Diet AND weight, we can add it as a parameter in the table() function:'],
  ['code', 'table(ChickWeight$weight, ChickWeight$Diet)'],

]

barplot_bootcamp_content_two = [
  ['text-info', 'To create a barplot we use the barplot() function in R.'],
  ['text', 'Lets just plot the frequency of the ChickWeight diet types.'],
  ['code', 'barplot(diet_freq)'],
  ['text', 'There are many additional arguments you can input into the barplot function.'],
  ['text-success', 'Check them out by using the help() function.'],
  ['code', 'help(barplot)'],
  ['text', ' We pass on basic parameters such as setting the length for the y-axis, labeling the axes, and the plot title.'],
  ['code', 'barplot(table(ChickWeight$Diet), ylim = c(0,250), ylab = "Observations", xlab = "Diet Type", main = "Chick Weight Diet")'],
  ['next_steps', nil],
]

barplot_bootcamp_step = Step.create!(
  title: "Barplots",
  lesson: visualize_lesson,
  step_id: 0,
)

barplot_bootcamp_slide = Slide.create!(
  content: barplot_bootcamp_content,
  parent: barplot_bootcamp_step,
  slide_id: 0,
)

barplot_bootcamp_slide_two = Slide.create!(
  content: barplot_bootcamp_content_two,
  parent: barplot_bootcamp_step,
  slide_id: 1,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "t_bootcamp_2",
  answer:"120",
  project: project,
  slide: barplot_bootcamp_slide,
  question: 'What is the frequency of diet type 2 and 3?',
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

density_plot_content = [
  ['text', 'Next we will show you how to estimate the probability density function (PDF) of a variable.'],
  ['text-info', 'A PDF is a function which describes the probability of that variable taking a given value.'],
  ['text', 'It is important to understand PDFs for many types of statistical analyses.'],
  ['text-success', 'One common example is checking normality assumptions.'],
  ['code', 'plot(density(ChickWeight$weight), main = "PDF of Chick Weight Variable")'],
  ['text', 'Looking at the visualization you can see that from the data given, it is likely that a randomly selected chick weighs approximately 80 grams.'],
  ['text-info', 'The plot() function is the generic function for plotting objects in R.'],
  ['text', 'Check help for all of the arguments in the function; there are many!'],
  ['text',  'We add additional arguments for clarity below:'],
  ['code', 'plot(density(ChickWeight$weight), main="PDF of Chick Weight Variable", 
    xlab = "Weight", ylab = "Probability")'],
  ['next_steps', nil],
]

density_plot_step = Step.create!(
  title: "Density Plots",
  lesson: visualize_lesson,
  step_id: 1,
)

density_plot_slide = Slide.create!(
  content: density_plot_content,
  parent: density_plot_step,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


programming_bootcamp_content = [
  ['text', 'In this bootcamp we will cover the two most fundamental control statements in programming:'],
  ['text-info', 'The if/else statement and the for loop.'],
  ['text', 'If you have any previous programming experience, you\'ll simply get a quick intro to R\'s syntax for control structures.'],
  ['text', 'By far the best way to understand them is to continuously use them;'],
  ['text-warning', 'Do not be concerned if these code snippets are difficult to understand!'],
  ['text', 'Eventually using these statements will become as familiar as writing 1 + 1'],
  ['lesson_links', nil]
]


programming_bootcamp_lesson = Lesson.create!(
  title: "Programming in R",
  project: project,
  lesson_id: 2,
)

programming_bootcamp_slide = Slide.create!(
  content: programming_bootcamp_content,
  parent: programming_bootcamp_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


if_else_content = [
  ['text', 'The first concept we will cover in programming in R is the if/else statement.'],
  ['text-success', 'The if/else statement is usually of the following form:'],
  ['code', 'if (logical condition) {'],
  ['code', '  statement 1'],
  ['code', '} else {'],
  ['code', '  statement 2'],
  ['code', '}'],
  ['text', 'Any expression (such as the ones from manipulating data section, or basic visualization section) can be put inside the { } brackets as statements.'],
  ['text-info', 'A logical condition must in a TRUE or FALSE statement or "boolean".'],
  ['text', 'If/else statements apply to virtually every programming language!'],
]

if_else_content_two = [
  ['text', 'Let\'s write an example if/else statement.'],
  ['text-success', 'The print() function prints whatever is in it to the R Console.'],
  ['code', 'if (1+1 == 2) {'],
  ['code', '  print("Knew It!")'],
  ['code', '} else {'],
  ['code', '  print("Something\'s Wrong.")'],
  ['code', '}'],
  ['text-success', 'We interpret the above code snippet as follows:'],
  ['text', ' - We first evaluate and check the logical condition.'],
  ['text', ' - Since it is true we go into the first statement.'],
  ['text', ' - Then we exit the if/else statement.'],
  ['text', 'As a result, if/else statements create mutually exclusive events.'],
  ['text-warning', 'Therefore the above if/else statment will either print "Knew it!" or "Something\'s wrong", but never both.'],
]


if_else_content_three = [
  ['text-info', 'You can also add additional "else" cases to make more complex if/else statements.'],
  ['text', 'We do an example here with the ChickWeight data:'],
  ['code', 'chick_weight = ChickWeight$weight[1]'],
  ['code', 'if (chick_weight == 100) {'],
  ['code', '  print("Fatty")'],
  ['code', '} else if (chick_weight > 50) {'],
  ['code', '  print("Still a fatty")'],
  ['code', '} else if (chick_weight < 20) {'],
  ['code', '  print("Skinny-legs")'],
  ['code', '} else {'],
  ['code', '  print("42 is a normal weight!")'],
  ['code', '}'],
]

if_else_content_four = [
  ['text-success', 'Here we set a variable "chick_weight" to be the weight of the first chick in the ChickWeight dataset.'],
  ['text', 'In the if/else statement, we first check in the following order:'],
  ['text', ' - if it\'s equal to 100'],
  ['text', ' - if it\'s greater than 50'],
  ['text', ' - if it\'s less than 20'],
  ['text', 'If at anytime the logical condition evaluates true, it immediately goes into the statement below, and then exit.'],
  ['text-warning', 'Since none of the logical conditions were true, we ended with the final statement clause!'],
  ['next_steps', nil],
]


if_else_step = Step.create!(
  title: "If/Else Statements",
  lesson: programming_bootcamp_lesson,
  step_id: 0,
)

if_else_slide = Slide.create!(
  content: if_else_content,
  parent: if_else_step,
  slide_id: 0,
)

if_else_slide_two = Slide.create!(
  content: if_else_content_two,
  parent: if_else_step,
  slide_id: 1,
)

if_else_slide_three = Slide.create!(
  content: if_else_content_three,
  parent: if_else_step,
  slide_id: 2,
)

if_else_slide_four = Slide.create!(
  content: if_else_content_four,
  parent: if_else_step,
  slide_id: 3,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

for_loop_content = [
  ['text', 'The next concept we\'ll cover is the "For Loop".'],
  ['text-success', 'The for loop repeats a statement or a series of statements for a specified number of times (or until a condition is met.)'],
  ['text', 'Lets take a look at one of its form in R:'],
  ['code', 'for( name of vector ) {'],
  ['code', '  statement 1'],
  ['code', '  statement 2'],
  ['code', '}'],
  ['text', 'How it works is most easily shown through examples.'],
  ['text', 'Here we define a vector "five_times" to be a vector of the numbers 1 through 5.'],
  ['text-warning', 'Then the for loop is read: "for each i in the vector five_times, print i"'],
  ['code', 'five_times = c(1:5)'],
  ['code', 'for(i in five_times) {'],
  ['code', '  print(i)'],
  ['code', '}'],
]

for_loop_content_two = [
  ['text-info', 'Remember that within the statement, block you can do any type of data manipulation.'],
  ['text-success', 'Here we loop through the number of observations in the ChickWeight weight and add five to each observation.'],
  ['code', 'numofchicks = length(ChickWeight$weight)'],
  ['text', 'Lets check the weight of the chicks before we implement this for loop'],
  ['code', 'head(ChickWeight$weight)'],
  ['code', 'for(i in c(1:numofchicks)) {'],
  ['code', '  ChickWeight$weight[i] = ChickWeight$weight[i] + 5'],
  ['code', '}'],
  ['text', 'Lets now re-check the weight of the chicks.'],
  ['code', 'head(ChickWeight$weight)'],
]

for_loop_content_three = [
  ['text-success', 'We are now going to combine our understanding of control structures and do cool stuff with the ChickWeight dataset.'],
  ['text', 'In the Titanic project, you will be creating indicator variables for your data.'],
  ['text', 'In this section, we will explain the syntax that achieves the result.'],
  ['text-warning', 'Let\'s say that we want an indicator variable for the ChickWeight dataset to highlight the chick weights that are greater than 100.'],
  ['text', 'First we create a new column in the ChickWeight data set.'],
  ['code', 'ChickWeight$FattyIndicator = 0'],
  ['text', 'Note that the above code will initialize a column with all "0".'],
]

for_loop_content_four = [
  ['text', 'Now we want to do write a for loop to loop through each of the weights in the weight column.'],
  ['text-success', 'If the weight is greater than 100, we want to save 1 to the "FattyIndicator" column.'],
  ['code', 'for (i in c(1:nrow(ChickWeight))) {'],
  ['code', '  if (ChickWeight$weight[i] > 100) {'],
  ['code', '    ChickWeight$FattyIndicator[i] = 1'],
  ['code', '  } else {'],
  ['code', '    ChickWeight$FattyIndicator[i] = 0'],
  ['code', '  }'],
  ['code', '}'],
  ['text', 'Check which chicks are fatty\'s!'],
  ['code', 'ChickWeight'],
  ['text', 'Great! Now you\'re ready to take on Titanic!'],
  #['feedback', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
  #['project_link', 'Back to the lessons page'],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]


for_loop_step = Step.create!(
  title: "For Loops",
  lesson: programming_bootcamp_lesson,
  step_id: 1,
)


for_loop_slide = Slide.create!(
  content: for_loop_content,
  parent: for_loop_step,
  slide_id: 0,
)

for_loop_slide_two = Slide.create!(
  content: for_loop_content_two,
  parent: for_loop_step,
  slide_id: 1,
)

for_loop_slide_three = Slide.create!(
  content: for_loop_content_three,
  parent: for_loop_step,
  slide_id: 2,
)

for_loop_slide_four = Slide.create!(
  content: for_loop_content_four,
  parent: for_loop_step,
  slide_id: 3,
)
