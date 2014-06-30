
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
###########  Data Exploration  #################################################
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

cleaning_slide_one = Slide.create!(
  content: cleaning_content_one,
  parent: cleaning_step,
  slide_id: 0,
)

cleaning_slide_two = Slide.create!(
  content: cleaning_content_two,
  parent: cleaning_step,
  slide_id: 1,
)

############### Plotting ##############

plotting_content_one = [
  ['text', "Now we're ready to plot the data"],
  ['code', 'par(mfrow=c(1,1)) #setting to the default plot param'],
  ['text', 'We plot on a fresh canvas via plot()'],
  ['code', "plot(rawFluData$Canada ~ rawFluData$Date, main=\"Flu Trend Compared\", xlab='Time',
      ylab='Cases / Week', type='l', col='blue') #what happened?"],
  ['text', 'We add the lines via lines(), so that it draws on top of the alread-plotted canvas.'],
  ['code', "lines(rawFluData$South.Africa ~ rawFluData$Date,
      xlab='Time', ylab='Cases / Week', col='green') #what happened?"],
  ['code', "lines (rawFluData$Austria ~ rawFluData$Date,
      xlab='Time', ylab='Cases / Week', type='l', col='red') #what happened?"],
  ['code', 'legend(\'topleft\', c("Canada","Austria", "South Africa"), lty=1, col=c("blue", "red", "green"),
       bty=\'l\', cex=1.25, box.lwd = 1.2, box.col = "black")'],
  ]

plotting_content_two = [
  ['text', "What do we notice here?"],
  ['text', "The green line (for South Africa) indicates a certain number of missing."],
  ['text', 'This occurs up to about year 2005'],
  ['text', 'This could be problematic.'],
  ['text', 'Could there be more more missing data?'],
  ['text', "If we ignore the missing data, it'll surely invalidate some of our other analysis."],
  ['next_steps'],
]

plotting_step = Step.create!(
  title: "Plotting",
  lesson: data_exploration_lesson,
  step_id: 1,
)

view_data_slide = Slide.create!(
  content: plotting_content_one,
  parent: plotting_step,
  slide_id: 0,
)

view_data_slide_two = Slide.create!(
  content: plotting_content_two,
  parent: plotting_step,
  slide_id: 1,
)

################################################################################
##############  Missing Data  ##################################################
################################################################################
