
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

missing_data_content = [
  ['text', "Let's Analyze the missing data count."],
  ['lesson_links', nil],
]

missing_data_lesson = Lesson.create!(
  title: "Missing Data",
  project: project,
  lesson_id: 2,
)

missing_data_slide = Slide.create!(
  content: missing_data_content,
  parent: missing_data_lesson,
  slide_id: 0,
)

############### Analysis (Missing Data) ##############

analysis_missing_content_one = [
  ['text', "Let's plot the number of missing counrtries for each year."],
  ['text', "We'll use the apply() to apply a function (which we will explain in a bit)"],
  ['text', "We use the 'MARGIN' variable to indicate that we want to apply across the rows of our Data Frame."],
  ['text', "checkout help(apply) for more info."],
  ['text', "The function we apply is (we don't give it a name, making it an anonymous function):"],
  ['code', "function(x) {
     return (sum(is.na(x)))
}"],
  ]

analysis_missing_content_two = [
  ['text', "The previous anonymous function accepts an x (in this case a row in the form of a vector), which we feed into is.na()."],
  ['text', "is.na(x) will convert the given row into a vector of True/Fase depending on if the value is NA."],
  ['text', 'We finally call sum() on the True/False vector where True/False is auto-converted to 1/0 and summed to get a number.'],
  ['text', 'This number represents the total number of NA entries across a row.'],
  ['text', 'We now have our missing entries per year (per row) across countries.'],
  ['code', "missingCount = apply(rawFluData, MARGIN=1, function(x){return (sum(is.na(x)))})"],
]

analysis_missing_content_three = [
  ['text', "We then plot it across the years"],
  ['code', "plot(missingCount ~ rawFluData$Date, type='h',
    main='Missing Data in Flu Trend (28 Total)'],
    xlab='Date', ylab='Missing Countries', col='red')"],
  ['text', 'It looks like there was quite a bit of data missing prior to 2006.'],
  ['text', 'In fact prior to 2004, only a few countries had flu data.'],
  ['text', 'We can either choose a proxy to fill the missing data, or choose toignore it.'],
  ['text', "For our analysis we'll ignore/remove data entries prior to 2006."],
  ['next_steps',''],
]

analysis_missing_step = Step.create!(
  title: "Analyze Missing Data",
  lesson: missing_data_lesson,
  step_id: 0,
)

analysis_missing_slide_one = Slide.create!(
  content: analysis_missing_content_one,
  parent: analysis_missing_step,
  slide_id: 0,
)

analysis_missing_slide_two = Slide.create!(
  content: analysis_missing_content_two,
  parent: analysis_missing_step,
  slide_id: 1,
)

analysis_missing_slide_three = Slide.create!(
  content: analysis_missing_content_three,
  parent: analysis_missing_step,
  slide_id: 2,
)

############### Removal (Missing Data) ##############

remove_missing_content_one = [
  ['text', "We do a vector operation to only retain entries where the Date variable is newer than '2005-12-31'."],
  ['text', "Note that we convert '2005-12-13' via as.Date to achieve the desired conversion."],
  ['code', "cleanedFluData = rawFluData[rawFluData$Date > as.Date('2005-12-31'),]"],
  ['text', "We now have a set of workable data."],
  ['text', "Note that though the data is \"complete\", we're still not sure about it's underlying integrity;"],
  ['text', "there still might have been error in data entry and collection."],
]

remove_missing_content_two = [
  ['text', "Since we have 28 differet countries, let's take an average and name it the \"World\"."],
  ['code', 'cleanedFluData$World = rowMeans(cleanedFluData[,
    -which(names(cleanedFluData) == "Date")], na.rm=TRUE)'],
  ['text', 'Now let\'s plot the averaged "World" data.'],
  ['code', "plot (cleanedFluData$World ~ cleanedFluData$Date, main=\"Aggregated Flu Trend\",
    xlab='Time', ylab='Cases / Week', type='l', col='blue')"],
  ['text', 'This looks like a decent piece of data to fit a time series model.'],
  ['text', 'The first few thing we have to do is removing seasonality and de-trending in the data.'],
  ['text', "There doesn't actually seem to be any strong trend with the data (thank goodness), so we'll concentrate on removing seasonality."],
  ['next_steps', ''],
]

remove_missing_step = Step.create!(
  title: "Remove Missing Data",
  lesson: missing_data_lesson,
  step_id: 1,
)

remove_missing_slide_one = Slide.create!(
  content: remove_missing_content_one,
  parent: remove_missing_step,
  slide_id: 0,
)

remove_missing_slide_two = Slide.create!(
  content: remove_missing_content_two,
  parent: remove_missing_step,
  slide_id: 1,
)

################################################################################
##############  Time Series Model  #############################################
################################################################################
time_series_data_content = [
  ['text', "The onverall concept behind time series model involves removing trend and seasonality (effectively reducing it to white noise.)"],
  ['text', "Once you achieve that, you can fit a time series model to help you make predictions."],
  ['lesson_links', nil],
]

time_series_data_lesson = Lesson.create!(
  title: "Time Series Model",
  project: project,
  lesson_id: 2,
)

time_series_data_slide = Slide.create!(
  content: time_series_data_content,
  parent: time_series_data_lesson,
  slide_id: 0,
)

############### Set up ##############

time_series_setup_content_one = [
  ['text', "We remove seasonality and trend, we're going to rely on Differencing."],
  ['text', "In R, we do differcing using diff() function."],
  ['code', 'help(diff)'],
  ['code', 'diff(c(1,2,5,10))'],
  ['text', "Try constructing a few other vectors and differencing."],
  ]

time_series_setup_content_two = [
  ['text', "Additionally we'll be using the acf() function to evaluate the data."],
  ['text', "acf() returns the estimates for auto-covariance function, which can be plotted to evaluate the data."],
  ['code', 'help(acf)'],
  ['text', 'The idea behind differencing is to reduce the data to white-noise, which should have acf below the dotted blue line that it plots.'],
  ['text', "In the next section, we'll be plotting the acf of the differenced data."],
  ['text', "Don't forget to check whether the acf follows the guildines we listed here."],

]

time_series_setup_content_three = [
  ['text', "Now let's setup R to split the plotting area to 4 by 2 (4 rows, 2 column) in case your plots are cluttered."],
  ['code', 'par(mfrow=c(4, 2))'],
  ['text', 'We then create a blank canvas via the following.'],
  ['text', 'plot.new()'],
  ['text', 'This will enable us to do side-by-side comparison.'],
  ['text', "Since we're dividing the area into 8, the plots will be smaller. Use \"Zoom\" to open a larager view."],
  ['text', "WARN: When plotting below, you might get a 'Error in plot.new() : figure margins too large' message."],
  ['text', "This generally means the plotting area is too small for the plot you're making (esp since we just divided the plot area into 8 pieces)."],
  ['text', "If you're working in Rstudio, shrink the environment/history tab/block on the top-right corner of your IDE. "],
  ['text', "This will give the plotting area more rom to work it."],
]

"We'll also reset the plotting area just in case your plots are cluttered."

time_series_setup_step = Step.create!(
  title: "Setup",
  lesson: data_exploration_lesson,
  step_id: 0,
)

time_series_setup_slide = Slide.create!(
  content: time_series_setup_content_one,
  parent: time_series_setup_step,
  slide_id: 0,
)

time_series_setup_slide_two = Slide.create!(
  content: time_series_setup_content_two,
  parent: time_series_setup_slide,
  slide_id: 1,
)

time_series_setup_slide_three = Slide.create!(
  content: time_series_setup_content_three,
  parent: time_series_setup_slide,
  slide_id: 2,
)

##############
######## SPARE ###
########

remove_missing_content_three = [
  ['text', ''],
  ['text', ''],
  ['text', ''],
  ['text', ''],
  ['text', ''],
  ['text', ''],
  ['text', ''],
  ['text', ''],
]
















