main_page_content = [
  ['text', 'This tutorial will introduce and explain three topics which will be utilized in the Titanic: Machine Learning from Disaster data project created by Kaggle.'],
  ['text', '- Data manipulation in R'],
  ['text', '- Creating visualizations in R'],
  ['text', '- Programming in R']
]

project = Project.create!(
  title: "Titanic Bootcamp",
  description: main_page_content,
  short_description: "In this bootcamp you will be introduced to the R programming concepts necessary to fully understand the Titanic: Machine Learning from Disaster data project.",
  number: 10,
  enabled: true,
)


################################################################################
puts "============ Created project: #{project.title}."
################################################################################


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

manipulate_data_content = [
  ['text', 'To teach data manipulation concepts we will work with a preloaded dataset "ChickWeight" in R.'],
  ['text', 'First familiarize yourself with the data by outputting it and reading about it in the help section'],
  ['text', 'To look at the raw data'],
  ['code', 'ChickWeight'],
  ['text', 'To access information about the dataset'],
  ['code', 'help(ChickWeight)'],
]


manipulate_lesson = Lesson.create!(
  title: "Manipulating Data in R",
  project: project
)

manipulate_slide = Slide.create!(
  content: manipulate_data_content,
  parent: manipulate_lesson
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

view_data_content = [
  ['text', 'Lets first determine what data type the ChickWeight dataset is in R.'],
  ['text', 'It looks to be in the standard data frame form, but to verify this you can write'],
  ['code', 'is.data.frame(ChickWeight)'],
  ['text', 'To see how many columns or rows the ChickWeight data frame has we can use the following functions:'],
  ['code', 'nrow(ChickWeight)'],
  ['code', 'ncol(ChickWeight)'],
  ['text', 'If you want to look at the first six rows of the data frame you can use the head() function'],
  ['code', 'head(ChickWeight)'],
  ['text', 'What is the weight of the sixth chick?'],
  ['quiz', 't_bootcamp_1'],
]

quiz = Quiz.create!(
  quiz_id: "t_bootcamp_1",
  answer:"108",
)

view_data_content_two = [
  ['text', 'You can also see the last six rows by using the tail() function'],
  ['code', 'tail(ChickWeight)'],
  ['text', 'To list the names of the columns in the data frame enter'],
  ['code', 'colnames(ChickWeight)'],
  ['text', 'If you want to select individual columns of a data frame you use the "$" followed by the title of the column you want to select.'],
  ['code', 'ChickWeight$weight'],
]

view_data_step = Step.create!(
  title: "Viewing Data in R",
  lesson: manipulate_lesson
)

view_data_slide = Slide.create!(
  content: view_data_content,
  parent: view_data_step
)

view_data_slide_two = Slide.create!(
  content: view_data_content_two,
  parent: view_data_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


index_data_content = [
  ['text', 'You can also index by position in three ways. The first way is in "matrix" format. You can select by [row,column] from the ChickWeight data frame'],
  ['code', 'ChickWeight[1,1]'],
  ['text', 'You can also index individual columns by using the "$" and then index in vector format. Here we select the 5th value from the weight column in the ChickWeight dataset'],
  ['code', 'ChickWeight$weight[5]'],
  ['text', 'If we wanted to grab a range of values in the weight column we index by a vector of values'],
  ['code', 'ChickWeight$weight[c(1:5)]'],
  ['text', 'Finally you can index a dataset by logical comparisons. Here we select all of the weights which are greater than 10.'],
  ['code', 'ChickWeight$weight[ChickWeight$weight > 10]'],
]

index_data_content_two = [
  ['text', 'If we want to index and return the entire dataset we can again use the same [row, column] format. We index the entire data frame by selecting all rows where the weight is greater than 10.'],
  ['code', 'data_with_weight_greater_than_ten <- ChickWeight[ChickWeight$weight > 10, ]'],
  ['text', 'We assign this newly indexed data frame to the variable name data_with_weight_greater_than_ten. To view it use the head() function.'],
  ['code', 'head(data_with_weight_greater_than_ten)'],
]


index_data_step = Step.create!(
  title: "Indexing Data in R",
  lesson: manipulate_lesson

)

index_slide = Slide.create!(
  content: index_data_content,
  parent: index_data_step

)

index_slide_two = Slide.create!(
  content: index_data_content_two,
  parent: index_data_step

)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


visualize_bootcamp_content = [
  ['text', 'R has tons of extra resources for making complex visualizations. In this bootcamp we will introduce a couple of the most basic ones.'],
  ['text', 'R\'s powerful visualization tools are one of its biggest advantages though so be sure to do your own research on how to create beautiful graphics.'],
]


visualize_lesson = Lesson.create!(
  title: "Basic Visualizations",
  project: project
)

visualize_bootcamp_slide = Slide.create!(
  content: visualize_bootcamp_content,
  parent: visualize_lesson
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

barplot_bootcamp_content = [
  ['text', 'To make a barplot we will first utilize the table() function in R. The table function calculates frequencies for a given variable. For example lets determine what was the frequency of the Diets in the ChickWeight dataset'],
  ['code', 'diet_freq <- table(ChickWeight$Diet)'],
  ['text', 'What is the frequency of diet type 2 and 3?'],
  ['quiz', 't_bootcamp_2'],
  ['text', 'If we wanted to see the frequency by Diet AND weight we can add it as a parameter in the table() function'],
  ['code', 'table(ChickWeight$weight, ChickWeight$Diet)'],

]

barplot_bootcamp_content_two = [
  ['text', 'To create a barplot we use the barplot() function in R. Lets just plot the frequency of the ChickWeight diet types.'],
  ['code', 'barplot(diet_freq)'],
  ['text', 'There are a lot of additional arguments you can input into the barplot function. Check them out by using the help() function.'],
  ['code', 'help(barplot)'],
  ['text', ' We do some of the basic ones such as setting the length for the y-axis, labeling the axes, and the plot title.'],
  ['code', 'barplot(table(ChickWeight$Diet), ylim = c(0,250), ylab = "Observations", xlab = "Diet Type", main = "Chick Weight Diet")'],
]

quiz = Quiz.create!(
  quiz_id: "t_bootcamp_2",
  answer:"120",
)


barplot_bootcamp_step = Step.create!(
  title: "Barplots"
  lesson: visualize_lesson
)

barplot_bootcamp_slide = Slide.create!(
  content: barplot_bootcamp_content,
  parent: barplot_bootcamp_step
)

barplot_bootcamp_slide_two = Slide.create!(
  content: barplot_bootcamp_content_two,
  parent: barplot_bootcamp_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


