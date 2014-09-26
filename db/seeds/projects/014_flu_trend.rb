
main_page_content = [
  ['text', "In this project, we'll be walking through an analysis involving time series data. More specifically, we'll be working with Flu Data acquired from Quandl."],
  ['text', 'Keep in mind that the data can contain errors. Countries with more advanced medical care can demonstrate higher and more accurate flu count.'],
  ['text-success', "Let's get started!"],
]

project = Project.create!(
  title:"Analyzing Flu Trends",
  description: main_page_content,
  short_description: "A data project focused on analyzing flu trends data. We'll build a time series model to make predictions on flu trends.",
  number: 14,
  enabled: true,
  uid: 14,
  difficulty: 'Advanced',
  category: Project::LESSON,
  is_new: true,
  cover_photo: "flu-trends",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

data_acquisition_content = [
  ['text', "We'll first download the data from Quandl here:"],
  ['link', 'http://www.quandl.com/GOOGLEORG/FLUCOUNTRY-Flu-Trends'],
  ['text', "Click on download and select CSV as your format"],
  ['text', 'Quandl is a great free resource for data.'],
  ['text', 'Put the downloaded data into a folder; remember to set the working directory to that particular folder.'],
  ['text', 'Eg:'],
  ['code', "setwd('/Users/James/Desktop/quandl_flu/')"],
  ['text', "Then read the data into R via read.csv():"],
  ['code', "rawFluData <- read.csv(\"FLUCOUNTRY.CSV\", header = TRUE, stringsAsFactors = FALSE)"],
  ['text-success', "Now we're ready to begin the analysis!"],
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
  ['text', 'We\'ll do a minor amount of cleaning, followed by extensive plotting to get a better sense of the data.'],
  ['lesson_links', nil],
]

data_exploration_lesson = Lesson.create!(
  title: "Preliminary Exploration",
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
  ['code', "head(rawFluData)"],
  ['quiz', "ft_clean_1"],
  ['text', "Often times, date and time are read as strings or characters. Let's check."],
  ['code', 'class(head(rawFluData$Date))'],
  ['text', 'As we supected.'],
  ['text', "We'll use as.Date() function to convert the characters into Date objects."],
]

cleaning_content_two = [
  ['text', 'Try the following:'],
  ['code', 'help(as.Date)'],
  ['code', 'class(as.Date("2014-03-01"))'],
  ['quiz', 'ft_clean_0'],
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

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_clean_1",
  answer:"28",
  project: project,
  slide: cleaning_slide_one,
  question: "How many countries do we have data for?",
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_clean_0",
  answer:"Date",
  project: project,
  slide: cleaning_slide_two,
  question: "What class did it return? Omit any quotes.",
)

############### Plotting ##############

plotting_content_one = [
  ['text', "Now we're ready to plot the data."],
  ['code', 'par(mfrow=c(1,1)) #setting to the default plot param'],
  ['text', 'We plot on a fresh canvas via plot():'],
  ['code', "plot(rawFluData$Canada ~ rawFluData$Date, main=\"Flu Trends Compared\", xlab='Time',
      ylab='Cases / Week', type='l', col='blue') #what plotted?"],
  ['text', 'We add the lines via lines(), so that it draws on top of the already-plotted canvas.'],
  ['code', "lines(rawFluData$South.Africa ~ rawFluData$Date,
      xlab='Time', ylab='Cases / Week', col='green') #what plotted?"],
  ['code', "lines (rawFluData$Austria ~ rawFluData$Date,
      xlab='Time', ylab='Cases / Week', type='l', col='red') #what plotted?"],
  ['code', 'legend(\'topleft\', c("Canada","Austria", "South Africa"), lty=1, col=c("blue", "red", "green"), bty=\'l\', cex=1.25, box.lwd = 1.2, box.col = "black")'],
  ['text', "We'll only work on the plotted 3 countries for now"],
  ]

plotting_content_two = [
  ['text', "What do we notice here?"],
  ['text-success', "The green line (for South Africa) shows a certain number of missing years."],
  ['text', 'This occurs up to about year 2005 and could be problematic.'],
  ['text', 'Could there be more more missing data?'],
  ['text-danger', "If we ignore the missing data, it'll surely invalidate some of our other analyses."],
  ['quiz', 'ft_plot_1'],
  ['next_steps'],
]

plotting_step = Step.create!(
  title: "Plotting",
  lesson: data_exploration_lesson,
  step_id: 1,
)

plotting_data_slide_one = Slide.create!(
  content: plotting_content_one,
  parent: plotting_step,
  slide_id: 0,
)

plotting_data_slide_two = Slide.create!(
  content: plotting_content_two,
  parent: plotting_step,
  slide_id: 1,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_plot_1",
  answer:"Canada",
  project: project,
  slide: plotting_data_slide_two,
  question: "Which of the 3 countries seems to have the highest raw number of reported flu cases?",
)

################################################################################
##############  Missing Data  ##################################################
################################################################################

missing_data_content = [
  ['text', "Let's further analyze the missing data issue."],
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
  ['text-info', "Let's plot the number of countries with missing data for each year."],
  ['text', "We'll use apply() to apply a function (which we will explain in a bit)."],
  ['text', "We use the 'MARGIN' variable to indicate that we want to apply across the rows of our Data Frame."],
  ['text', "Check out help(apply) for more info."],
  ['text', "This is the function we're going to apply."],
  ['code', "function(x) {
     return (sum(is.na(x)))
}"],
  ['text', "Notice that the function doesn't quite have a name."],
  ]

analysis_missing_content_two = [
  ['quiz', "ft_missing_0"],
  ['text', "The previous function accepts an x (in this case a row in the form of a vector), which we feed into is.na()."],
  ['text-success', "is.na(x) will convert the given row into a vector of True/Fase depending on if the value is NA."],
  ['text', 'We finally call sum() on the True/False vector where True/False is auto-converted to 1/0 and summed to get a number.'],
  ['text', 'This number represents the total number of NA entries across a row.'],
  ['text', 'We now have our missing entries per year (per row) across countries.'],
  ['code', "missingCount = apply(rawFluData, MARGIN=1, function(x){return (sum(is.na(x)))})"],
]

analysis_missing_content_three = [
  ['text', "We then plot it over the years:"],
  ['code', "plot(missingCount ~ rawFluData$Date, type='h',
    main='Missing Data in Flu Trends (28 Total)',
    xlab='Date', ylab='Missing Countries', col='red')"],
  ['text-danger', 'It looks like there was quite a bit of data missing prior to 2006.'],
  ['text', 'In fact, prior to 2004, only a few countries had flu data.'],
  ['text', 'We can either choose a proxy to fill the missing data, or choose to ignore it.'],
  ['text-info', "For our analysis we'll ignore/remove data entries prior to 2006."],
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

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_missing_0",
  answer:"Anonymous Function",
  project: project,
  slide: analysis_missing_slide_two,
  question: "What do you call a function without a name? Try googling 'nameless functions'.",
)

############### Removal (Missing Data) ##############

remove_missing_content_one = [
  ['text', "We do a vector operation to only retain entries where the Date variable is newer than '2005-12-31'."],
  ['text', "Note that we convert '2005-12-13' via as.Date() to achieve the desired conversion."],
  ['code', "cleanedFluData = rawFluData[rawFluData$Date > as.Date('0005-12-31'),]"],
  ['text', "We now have a set of workable data."],
  ['text', "Note that though the data is \"complete\", we're still not sure about it's underlying integrity;"],
  ['text', "there still might have been error in data entry and collection."],
  ['text-success', "Since we have 28 differet countries, let's take an average and name it the \"World\"."],
  ['code', 'cleanedFluData$World = rowMeans(cleanedFluData[,
    -which(names(cleanedFluData) == "Date")], na.rm=TRUE)'],
]

remove_missing_content_two = [
  ['text', 'Now let\'s plot the averaged "World" data.'],
  ['code', "plot(cleanedFluData$World ~ cleanedFluData$Date, main=\"Aggregated Flu Trends\",
    xlab='Time', ylab='Cases / Week', type='l', col='blue')"],
  ['text-success', 'This looks like a decent piece of data to fit a time series model (As of our current date, June 2014).'],
  ['text', 'The first few things we have to do is remove seasonality and de-trend the data.'],
  ['text', "There doesn't actually seem to be any strong trend with our data (thank goodness), so we'll concentrate on removing seasonality."],
  ['quiz', 'ft_2'],
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

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_2",
  answer:"2",
  project: project,
  slide: remove_missing_slide_two,
  question: "How many large spikes of flu outbreaks do you see?",
)

################################################################################
##############  Time Series Model  #############################################
################################################################################
time_series_data_content = [
  ['text-info', "The overall concept behind time series models involves first removing trend and seasonality (effectively reducing it to white noise.)"],
  ['text', "Once we have the differenced data, we'll run analysis on them."],
  ['text', "The analysis involves looking at the underlying white noise to determine the parameters required for the time series model."],
  ['lesson_links', nil],
]

time_series_data_lesson = Lesson.create!(
  title: "Time Series Model Prep",
  project: project,
  lesson_id: 3,
)

time_series_data_slide = Slide.create!(
  content: time_series_data_content,
  parent: time_series_data_lesson,
  slide_id: 0,
)

############### Set up ##############

time_series_setup_content_one = [
  ['text', "In order to remove seasonality and trend, we're going to rely on Differencing."],
  ['text-success', "In R, we do differencing using the diff() function."],
  ['code', 'help(diff)'],
  ['code', 'diff(c(1,2,5,10))'],
  ['quiz', 'ft_3'],
  ['text', "Try constructing a few other vectors and apply differencing."],
]

time_series_setup_content_two = [
  ['text', "Additionally we'll be using the acf() function to evaluate the data."],
  ['text-success', "acf() returns the estimates for auto-covariance function, which can be plotted to evaluate the data."],
  ['code', 'help(acf)'],
  ['quiz', "ft_setup_0"],
]

time_series_setup_content_three = [
  ['quiz', "ft_setup_1"],
  ['text', 'The idea behind differencing is to reduce the data to white-noise, which should have ACF below the dotted blue line in the plot (you\'ll see this soon).'],
  ['text-info', 'Moreover, your ACF should also lack pattern and appear random.'],
  ['text', "In the next section, we'll be plotting the ACF of the differenced data."],
  ['text-danger', "Don't forget to check whether the ACF follows the guidelines we listed here."],
]

time_series_setup_content_four = [
  ['text', "Now let's setup R to split the plotting area to 4 by 2 (4 rows, 2 column) in case your plots are cluttered."],
  ['code', 'par(mfrow=c(4, 2))'],
  ['text', 'We then create a blank canvas via the following.'],
  ['code', 'plot.new()'],
  ['text', 'This will enable us to do side-by-side comparison.'],
  ['text', "Since we're dividing the area into 8, the plots will be smaller. \"Zoom\" to open a larager view."],
  ['text-danger', "WARN: When plotting, you might get a 'Error in plot.new() : figure margins too large' message."],
  ['text', "This generally means the plotting area is too small for the plot you're making (esp since we just divided the plot area into 8 pieces)."],
  ['text-success', "If you're working in Rstudio, shrink the environment/history view on the top-right corner of your screen."],
  ['text', "This will give the plotting area more room to work."],
  ['next_steps', '']
]

time_series_setup_step = Step.create!(
  title: "Setup",
  lesson: time_series_data_lesson,
  step_id: 0,
)

time_series_setup_slide = Slide.create!(
  content: time_series_setup_content_one,
  parent: time_series_setup_step,
  slide_id: 0,
)

time_series_setup_slide_two = Slide.create!(
  content: time_series_setup_content_two,
  parent: time_series_setup_step,
  slide_id: 1,
)

time_series_setup_slide_three = Slide.create!(
  content: time_series_setup_content_three,
  parent: time_series_setup_step,
  slide_id: 2,
)

time_series_setup_slide_four = Slide.create!(
  content: time_series_setup_content_four,
  parent: time_series_setup_step,
  slide_id: 3,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_3",
  answer: "3",
  project: project,
  slide: time_series_setup_slide,
  question: "How many values remain after the previous diff()?",
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_setup_0",
  answer: "3",
  project: project,
  slide: time_series_setup_slide_two,
  question: "In the ACF's Help screen, how many different values are allowed for the 'type' paremeter?",
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_setup_1",
  answer: "correlation",
  project: project,
  slide: time_series_setup_slide_three,
  question: "In the ACF's Help screen, what is the default value for the 'type' parameter?",
)

############### Diferencing ##############

time_series_differencing_content_one = [
  ['text-info', "First we'll do a lag=52 differencing. This means we're subtracting each data point by the the data point from 52 observations ago."],
  ['text', 'In our context, this means subtracting by the data from 52 weeks (i.e. 1 year) ago.'],
  ['text', 'This stems from assuming that flu has a seasonality of one year.'],
  ['text-success', 'Does that sound about right? Do flu trends have one-year cycles?'],
  ['code', 'cleanedFluData$diff_52 = c(diff(cleanedFluData$World, lag=52), rep(0,52))'],
  ['code', "plot (cleanedFluData$diff_52 ~ cleanedFluData$Date, main=\"Once Differenced Flu Data lag=52\", xlab='Time', ylab='Cases / Week', type='l', col='brown')"],
  ['code', "acf(cleanedFluData$diff_52, lag.max = 160, main=\"ACF for lag=(52)\", col='brown')"],
  ['text', "Also, we padded the differenced data with 0 via rep() method (see help(rep))."],
  ['text-warning', "Remember when you differenced earlier, and how differencing shaved away data point(s)."],
  ['text', "Let's add the rest of the plots so we can compare."],
]

time_series_differencing_content_two = [
  ['text', 'In this plot, we first difference by 52, then we difference by the the immediately previous observation.'],
  ['text-success', 'This is known as twice differencing, first by lag-52 followed by lag-1.'],
  ['code', 'cleanedFluData$diff_52.1 = c(diff(diff(cleanedFluData$World, lag=52)), rep(0,53))'],
  ['code', "plot (cleanedFluData$diff_52.1 ~ cleanedFluData$Date, main=\"Twice Differenced Flu Data lag=(52,1)\", xlab='Time', ylab='Cases / Week', type='l', col='gray')"],
  ['code', "acf(cleanedFluData$diff_52.1, lag.max = 160, main=\"ACF for lag=(51, 1)\", col='gray')"],
  ['text', 'What about simply differencing once by the immediately previous observation?'],
  ['code', 'cleanedFluData$diff_1 = c(diff(cleanedFluData$World), rep(0,1))'],
  ['code', "plot (cleanedFluData$diff_1 ~ cleanedFluData$Date, main=\"Once Differenced Flu Data lag=1\", xlab='Time', ylab='Cases / Week', type='l', col='orange')"],
  ['code', "acf(cleanedFluData$diff_1, lag.max = 160, main=\"ACF for lag=(1)\", col='orange')"],
  ['text', "How do the plots look?"],
  ['text-info', "Remember, we're looking to remove any trend or seasonality!"],
]

time_series_differencing_content_three = [
  ['text', "Lastly we'll try differencing twice again, but both times with a lag-1 (meaning immediately previous observations)."],
  ['text-success', "From experience, this differencing method seems to always work the best."],
  ['code', 'cleanedFluData$diff_1.1 = c(diff(diff(cleanedFluData$World)), rep(0,2))'],
  ['code', "plot (cleanedFluData$diff_1.1 ~ cleanedFluData$Date, main=\"Twice Differenced Flu Data lag=(1,1)\", xlab='Time', ylab='Cases / Week', type='l', col='purple')"],
  ['code', 'acf(cleanedFluData$diff_1.1, lag.max = 160, main="ACF for lag=(1, 1)", col=\'purple\')'],
  ['text', 'Now let\'s compare the plots. Use zoom to get a better view.'],
  ['text', 'Remember what we said about ACF and the blue dotted lines?'],
  ['text-info', 'Which method seems to work best?'], #@TODO Include img here
  ['next_steps', '']
]

time_series_differencing_step = Step.create!(
  title: "Differencing",
  lesson: time_series_data_lesson,
  step_id: 1,
)

time_series_differencing_slide = Slide.create!(
  content: time_series_differencing_content_one,
  parent: time_series_differencing_step,
  slide_id: 0,
)

time_series_differencing_slide_two = Slide.create!(
  content: time_series_differencing_content_two,
  parent: time_series_differencing_step,
  slide_id: 1,
)

time_series_differencing_slide_three = Slide.create!(
  content: time_series_differencing_content_three,
  parent: time_series_differencing_step,
  slide_id: 2,
)

############### Final ACF Analysis ##############

time_series_differencing_content_one = [
  ['text', "Reset plotting area, in case your plotting area is cluttered."],
  ['text-info', "You don't have to do this everytime, but it makes following along easier."],
  ['code', 'par(mfrow=c(1, 1))'],
  ['code', 'plot.new()'],
  ['code', 'par(mfrow=c(2, 1)) #set to 2-by-1'],
  ['code', "acf(cleanedFluData$diff_1.1, lag.max = 160, main=\"ACF Lag=(1,1)\")"],
  ['code', "pacf(cleanedFluData$diff_1.1, lag.max = 160, main=\"PACF (Partial ACF) Lag=(1,1)\")"],
  ['text-success', 'Now it looks like our ACF and PACF both consistently stay below the blue line.'], #@TODO EXPLAIN
]

time_series_differencing_content_two = [
  #['image', 'flu_trend/flu_trend_acf_pacf.png'],
  ['text', 'The ACF and PACF looks good here, except for when lag=0.'],
  ['text-danger', "At lag=0, the ACF is still explosively high!"],
  ['text', "But that's unavoidable. Think about it."],
  ['text', "We're measuring the correlation of data points with different data points at a certain lag."],
  ['text', "At lag=0, we're measuring the correlation of a data point with itself!"],
  ['text-success', "This will always yield full correlation (i.e. 1), since a single data point, by definition, will always correlate with itself."],
  ['text', 'Now we can move on to fitting a model.'],
  ['next_steps', ''],
]

time_series_differencing_step = Step.create!(
  title: "Final ACF Analysis",
  lesson: time_series_data_lesson,
  step_id: 2,
)

time_series_differencing_slide = Slide.create!(
  content: time_series_differencing_content_one,
  parent: time_series_differencing_step,
  slide_id: 0,
)

time_series_differencing_slide_two = Slide.create!(
  content: time_series_differencing_content_two,
  parent: time_series_differencing_step,
  slide_id: 1,
)
################################################################################
##############  Construct ARIMA model  #########################################
################################################################################

arima_data_content = [
  ['text-success', "Now we're ready to fit a time series model, specifically ARIMA (Autoregressive Integrated Moving Average)."],
  ['text', "A simpler explanation:"],
  ['link', "http://www.investopedia.com/terms/a/autoregressive-integrated-moving-average-arima.asp"],
  ['text', "A more comprehensive explanation:"],
  ['link', "http://www.slideshare.net/21_venkat/arima-26196965"],
  ['lesson_links', nil],
]

arima_data_lesson = Lesson.create!(
  title: "ARIMA Model",
  project: project,
  lesson_id: 4,
)

arima_data_slide = Slide.create!(
  content: arima_data_content,
  parent: arima_data_lesson,
  slide_id: 0,
)

############### Building ARIMA ##############

time_series_differencing_content_one = [
  ['text', "Reset plotting area, in case your plotting area is cluttered."],
  ['code', "par(mfrow=c(1, 1))"],
  ['code', "plot.new()"],
  ['text', "We'll first build the model."],
  ['text-info', "The model building will take a while, so we'll talk about the details while it builds."],
  ['text', "Run the command first, and then we'll walk through the parameter selection."],
  ['text', "As always, use help() to get documentations on the new/unknown function."],
  ['code', "help(arima)"],
  ['text', "Check out what the parameters represent."],
]

time_series_differencing_content_two = [
  ['text-warning', "*Note that this might take a while.*"],
  ['code', "flu_arima = arima(cleanedFluData$World,
            seasonal = list(order = c(0, 2, 2), period = 52), 
            order = c(1,0,0), method=\"CSS-ML\")"],
  ['text', "The parameter selection comes from assessing the ACF and PACF."],
  ['text', "For example, if you look back at the ACF and PACF, we see initial blips (over the blue line) for ACF from period 1 up to period 2"],
  ['text', "This gives us MA 2."],
  ['text', "Moreover, we also see blips in ACF over the blue line at period 52 and period 104."],
  ['text', "This gives us the seasonal MA of 2 (since 52 is our period, and it blips again at 104)."],
  ['text-info', "We do a similar analysis on PACF with regards to AR."],
]

time_series_differencing_content_three = [
  ['text-info', "We also do additional parameter tweaking based on AIC score to arrive at our parameters."],
  ['link', "http://www.brianomeara.info/tutorials/aic"],
  ['quiz', "ft_build_0"],
  ['code', 'flu_arima'],
  ['code', 'flu_arima$aic'],
  ['text', "Keep in mind that our original data might look different from yours (since you grabbed the freshest dataset from Quandl)."],
  ['text', "That means our original parameter selection might no longer be optimal as well."],
  ['text', "Try tweaking the parameters. (Do more complex ARIMA models take longer to build?)"],
  ['text-success', "Don't spend too much time optimizing the model; save that for the corresponding Data Challenge!"],
  ['next_steps', ''],
]

time_series_differencing_step = Step.create!(
  title: "Build",
  lesson: arima_data_lesson,
  step_id: 0,
)

time_series_differencing_slide = Slide.create!(
  content: time_series_differencing_content_one,
  parent: time_series_differencing_step,
  slide_id: 0,
)

time_series_differencing_slide_two = Slide.create!(
  content: time_series_differencing_content_two,
  parent: time_series_differencing_step,
  slide_id: 1,
)

time_series_differencing_slide_three = Slide.create!(
  content: time_series_differencing_content_three,
  parent: time_series_differencing_step,
  slide_id: 2,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_build_0",
  answer:"Akaike information criterion",
  project: project,
  slide: time_series_differencing_slide_three,
  question: "What does AIC stand for?",
)

############### Predicting via ARIMA ##############

arime_prediction_content_one = [
  ['text', "Now that the model is built, we'll ask it to predict the trend over the next 104 periods (2 years)."],
  ['code', "ahead=104 #104 weeks"],
  ['code', 'flu_fcast = predict(flu_arima, n.ahead = ahead)'],
  ['code', 'class(flu_fcast) #Check what is returned'],
  ['code', 'flu_fcast'],
  ['quiz', "ft_prediction_0"],
  ['text', "Now we'll construct new x-y series to visualize."],
  ['text-success', "Note that we will generate the x-variables via seq() function."],
]

arime_prediction_content_two = [
  ['text-success', "length.out=ahead means to generate up to ahead variable (which we set to be 104 ahead). by='1 week', we specify that we want to increment by one week at a time."],
  ['code', 'newx = c(rev(seq(cleanedFluData$Date[1], length.out=ahead, by="1 week")), cleanedFluData$Date)'],
  ['text', 'We simply append the forecast data for the new y.'],
  ['code', 'newy = c(flu_fcast$pred, cleanedFluData$World)'],
  ['text', 'We then generate the raw plot.'],
  ['code', 'par(mfrow=c(1, 1))'],
  ['code', 'plot.new()'],
  ['code', 'plot(newx, newy, type = "l", xlab = "weeks", ylab = "values", col=\'brown\',
     main = "World Flu Trends Plot including the 52-week forecast")'],
]

arime_prediction_content_three = [
  ['text', "Append to the old canvas with the new data point so it's easier to analyze."],
  ['code', 'points(newx[1:ahead], flu_fcast$pred, col = "red", type = "l", lwd=5)'],
  ['text-success', 'We simply append the forecast data for the new y.'],
  ['text', 'Add in the Standard Error curve:'],
  ['code', 'points(newx[1:ahead], rev(flu_fcast$pred - 2*flu_fcast$se), col = "blue", type = "l", lwd=3)'],
  ['code', 'points(newx[1:ahead], rev(flu_fcast$pred + 2*flu_fcast$se), col = "blue", type = "l", lwd=3)'],
  ['text', 'How does the prediction look?'],
  ['text', 'The blue lines represent the relatively possible outcomes (SE lines).'],
  ['text', "You might have noticed that the SE lines expand rather rapidly."],
  ['text-info',' This tells us that the model loses a lot of predictive confidence relatively fast.'],
  ['next_steps', ''],
]

arime_prediction_step = Step.create!(
  title: "Prediction",
  lesson: arima_data_lesson,
  step_id: 1,
)

arime_prediction_slide = Slide.create!(
  content: arime_prediction_content_one,
  parent: arime_prediction_step,
  slide_id: 0,
)

arime_prediction_slide = Slide.create!(
  content: arime_prediction_content_two,
  parent: arime_prediction_step,
  slide_id: 1,
)

arime_prediction_slide = Slide.create!(
  content: arime_prediction_content_three,
  parent: arime_prediction_step,
  slide_id: 2,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_prediction_0",
  answer:"list",
  project: project,
  slide: arime_prediction_slide,
  question: "What class is flu_fcast?",
)
############### Predicting via ARIMA ##############

arime_evaluation_content_one = [
  ['code', "par(mfrow=c(2, 1))"],
  ['text-success', "Let's look at the ACF/PACF of the RESIDUALS of the model (remember that we already looked at the ACF of the raw data)."],
  ['code', 'acf(flu_arima$resid, lag.max = 160, main ="ACF of fitted residuals")'],
  ['code', 'pacf(flu_arima$resid, lag.max = 160, main = "PACF of fitted residuals")'],
  ['text', "We'll also look at tsdiag(), which is essentially a diagnostic of the model:"],
  ['code', "help(tsdiag)"],
  ['code', 'tsdiag(flu_arima, gof.lag=400)'],
  ['quiz', 'ft_evaluation_0'],
]

arime_evaluation_content_two = [
  ['text-success', 'The 1st plot is the residuals of the model.'],
  ['text', "We want to make sure that the residuals look random and evenly distributed around y=0."],
  ['text-success', "The 2nd plot is the ACF of the residuals."],
  ['text', "Similar as before, we want to make sure that the ACF remains below the blue line."],
  ['text-success', "The 3rd plot is the Ljung-Box Statistic."],
  ['text', "We use Ljung-Box statistic to test whether a series of observations over time are random and independent."],
  ['text', "This time we want to confirm that the p-value remains ABOVE the blue line. For more info, check these out:"],
  ['link', "http://support.minitab.com/en-us/minitab/17/topic-library/modeling-statistics/time-series/diagnostic-checking/what-is-the-ljung-box-q-statistic/"],
  ['link', " http://www.itl.nist.gov/div898/software/dataplot/refman1/auxillar/ljungbox.htm"],
  ['text-info', "Do the plots look good for our model?"],
  ['next_steps', ''],
]

arime_evaluation_step = Step.create!(
  title: "Evaluation",
  lesson: arima_data_lesson,
  step_id: 2,
)

arime_evaluation_slide = Slide.create!(
  content: arime_evaluation_content_one,
  parent: arime_evaluation_step,
  slide_id: 0,
)

arime_evaluation_slide = Slide.create!(
  content: arime_evaluation_content_two,
  parent: arime_evaluation_step,
  slide_id: 1,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "ft_evaluation_0",
  answer:"3",
  project: project,
  slide: arime_evaluation_slide,
  question: "How many plots did tsdiag() produce?",
)
################################################################################
##############  Conclusion  ####################################################
################################################################################

conclusion_content = [
  ['text-info', "We've now successfully built a time series model after some initial data exploration."],
  ['text', "1. We started with a set of data."],
  ['text', "2. We figured out the missing data points and cleaned the dataset."],
  ['text', "3. We differenced the dataset to figure out the model parameters (we also relied on AIC)."],
  ['text', "4. We built the model, plotted the predicted values, and saw that the SE grew relatively fast."],
  ['text', "5. Finally we evaluated the model by looking at its residuals / tsdiag()"],
  ['text-danger', "Though the model looked good, don't forget to keep in mind that our model is only as good as our original data source."],
  ['text-success', "Congrats, now you know how to build time series models!"],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  project: project,
  lesson_id: 5,
)

conclusion_slide = Slide.create!(
  content: conclusion_content,
  parent: conclusion_lesson,
  slide_id: 0,
)

