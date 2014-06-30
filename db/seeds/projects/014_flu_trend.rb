
main_page_content = [
	['text', "In this project, we'll be walking through an analysis involving Time Series Data. More specifically, we'll be workign with Flu Data acquired from Quandl."],
	['text' ,'Keep in mind that the data can contain errors. Countries with more advanced medical care can demonstrate higher and more accurate flu count.'],
]

project = Project.create!(
  title:"Analyzing Flu Trend",
  description: main_page_content,
  short_description: "A data project focused on analyzing flu trend data. We'll be building a time series model to make predictions on flu trend.",
  number: 14,
  enabled: true,
  uid: 14,
  difficulty: 'Advanced',
  category: Project::LESSON,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

data_acquisition_content = [
  ['text', "We'll first download the data from Quandl here:"],
  ['link', 'http://www.quandl.com/GOOGLEORG/FLUCOUNTRY-Flu-Trends'],
  ['text', 'Put the downloaded data into a folder; remember to set the working directory to that particular folder.'],
  ['text', 'Eg:'],
  ['code', "setwd('/Users/James/Desktop/quandl_flu/')"],
 	['text', "Then read the data into R via read.csv()"],
 	['code', "rawFluData <- read.csv(\"FLUCOUNTRY.CSV\", header = TRUE, stringsAsFactors = FALSE)"],
  ['text', "Now we're ready to begin the analysis!"],
  ['next_steps', nil],
]

data_acquisition_lesson = Lesson.create!(
  title: "Flu Data Acquisition",
  project: project,
  lesson_id: 0,
)

data_acquisition_slide = Slide.create!(
  content: data_acquisition_content,
  parent: data_acquisition_lesson,
  slide_id: 0,
)

################################################################################
##############Data Exploration##################################################
################################################################################

data_exploration_content = [
  ['text', 'As always, we have to explore the data before we start fitting a model.'],
  ['text', 'We\'ll do a minor amount of cleaning, followed by extensive plotting to get a better idea about the data.'],
  ['lesson_links', nil],
]

data_exploration_lesson = Lesson.create!(
  title: "Manipulating Data in R",
  project: project,
  lesson_id: 1,
)

data_exploration_slide = Slide.create!(
  content: data_exploration_content,
  parent: data_exploration_lesson,
  slide_id: 0,
)

###############Cleaning##############

cleaning_content_one = [
  ['text', "We'll see what kind of columns we have."],
  ['code', 'names(rawFluData) #Headers to the data.'],
  ['text', 'Note that we have to convert the string object e.g. "2014-03-01" into a Date Object.'],
  ['text', 'Try the following:'],
  ['code', 'class("2014-03-01")'],
  ['code', 'class(as.Date("2014-03-01"))'],
]

cleaning_content_two = [
  ['text', "We're going to apply the function to the Date column in our data."],
  ['text', "We'll save the result back into the column (overwriting it)."],
  ['code', 'rawFluData$Date = as.Date(rawFluData$Date, "%Y-%m-%d")'],
  ['next_steps'],
]

cleaning_step = Step.create!(
  title: "Cleaning",
  lesson: data_exploration_lesson,
  step_id: 0,
)

view_data_slide = Slide.create!(
  content: cleaning_content_one,
  parent: cleaning_step,
  slide_id: 0,
)

view_data_slide_two = Slide.create!(
  content: cleaning_content_two,
  parent: cleaning_step,
  slide_id: 1,
)









