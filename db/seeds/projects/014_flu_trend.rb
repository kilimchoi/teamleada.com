
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














