
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
  ['text', 'The idea behind differencing is to reduce the data to white-noise, which should have ACF below the dotted blue line that it plots.'],
  ['text', "In the next section, we'll be plotting the ACF of the differenced data."],
  ['text', "Don't forget to check whether the ACF follows the guildines we listed here."],

]

time_series_setup_content_three = [
  ['text', "Now let's setup R to split the plotting area to 4 by 2 (4 rows, 2 column) in case your plots are cluttered."],
  ['code', 'par(mfrow=c(4, 2))'],
  ['text', 'We then create a blank canvas via the following.'],
  ['code', 'plot.new()'],
  ['text', 'This will enable us to do side-by-side comparison.'],
  ['text', "Since we're dividing the area into 8, the plots will be smaller. \"Zoom\" to open a larager view."],
  ['text', "WARN: When plotting, you might get a 'Error in plot.new() : figure margins too large' message."],
  ['text', "This generally means the plotting area is too small for the plot you're making (esp since we just divided the plot area into 8 pieces)."],
  ['text', "If you're working in Rstudio, shrink the environment/history view on the top-right corner of your IDE. "],
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

############### Diferencing ##############

time_series_differencing_content_one = [
  ['text', "First we'll do a lag=52 differencing. This means we're minusing each data point by the the data point from 52 observations ago."],
  ['text', 'In our context, this means subtracting by the data from 52 weeks ago, i.e. 1 year'],
  ['text', 'This stems from assumning that flu has a seasonality of one year.'],
  ['text', 'Does that sound about right? Does flu trend have a one-year cycle?'],
  ['code', 'cleanedFluData$diff_52 = c(diff(cleanedFluData$World, lag=52), rep(0,52))'],
  ['code', "plot (cleanedFluData$diff_52 ~ cleanedFluData$Date, main=\"Once Differenced Flu Data lag=52\", xlab='Time', ylab='Cases / Week', type='l', col='brown')"],
  ['code', "acf(cleanedFluData$diff_52, lag.max = 160, main=\"ACF for lag=(52)\", col='brown')"],
]

time_series_differencing_content_two = [
  ['text', 'In this plot, we first difference by 52, then we difference by the the immediately previous observation.'],
  ['code', 'cleanedFluData$diff_52.1 = c(diff(diff(cleanedFluData$World, lag=52)), rep(0,53))'],
  ['code', "plot (cleanedFluData$diff_52.1 ~ cleanedFluData$Date, main=\"Twice Differenced Flu Data lag=(52,1)\", xlab='Time', ylab='Cases / Week', type='l', col='gray')"],
  ['text', "acf(cleanedFluData$diff_52.1, lag.max = 160, main=\"ACF for lag=(51, 1)\", col='gray')"],
  ['text', 'What about simply differencing by the immediately previously observation?'],
  ['code', 'cleanedFluData$diff_1 = c(diff(cleanedFluData$World), rep(0,1))'],
  ['code', "plot (cleanedFluData$diff_1 ~ cleanedFluData$Date, main=\"Once Differenced Flu Data lag=1\", xlab='Time', ylab='Cases / Week', type='l', col='orange')"],
  ['code', "acf(cleanedFluData$diff_1, lag.max = 160, main=\"ACF for lag=(1)\", col='orange')"],
]

time_series_differencing_content_three = [
  ['text', "Lastly we'll try differencing twice, both with a lag of 1 (meaning immeditely previously observation)."],
  ['text', "From experience, this differencing method seems to always work out."],
  ['code', 'cleanedFluData$diff_1.1 = c(diff(diff(cleanedFluData$World)), rep(0,2))'],
  ['code', "plot (cleanedFluData$diff_1.1 ~ cleanedFluData$Date, main=\"Twice Differenced Flu Data lag=(1,1)\", xlab='Time', ylab='Cases / Week', type='l', col='purple')"],
  ['code', 'acf(cleanedFluData$diff_1.1, lag.max = 160, main="ACF for lag=(1, 1)", col=\'purple\')'],
  ['text', 'Now Let\'s compare the plot. Use Zoom to get a better view.'],
  ['text', 'Remember what we said about ACF and the blue dotted lines?'],
  ['text', 'Which method seems to work best?'], #@TODO Include img here
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
  ['text', "You don't have to do this everytime, but it makes following the post easier."],
  ['code', 'par(mfrow=c(1, 1))'],
  ['code', 'plot.new()'],
  ['code', 'par(mfrow=c(2, 1)) #set to 2-by-1'],
  ['code', "acf(cleanedFluData$diff_1.1, lag.max = 160, main=\"ACF Lag=(1,1)\")"],
  ['code', "pacf(cleanedFluData$diff_1.1, lag.max = 160, main=\"PACF (Partial ACF) Lag=(1,1)\")"],
  ['text', ''], #@TODO EXPLAIN
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

################################################################################
##############  Construct ARIMA model  #########################################
################################################################################

arima_data_content = [
  ['text', "Now we're ready to fit a time series model, specifically ARIMA (Autoregressive Integrated Moving Average)."],
  ['text', ""],
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
  ['code', "flu_arima = arima(cleanedFluData$World, seasonal = list(order = c(0, 2, 2), period = 52), order = c(2,0,0), method=\"CSS-ML\") # c(0,0,2)"],
  ['code', 'flu_arima$aic'],
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

############### Predicting via ARIMA ##############

arime_prediction_content_one = [
  ['text', "Now that the model is built, we'll ask it to predict the trend over the next 104 periods (2 years)"],
  ['code', "ahead=104 #52 weeks"],
  ['code', 'flu_fcast = predict(flu_arima, n.ahead = ahead)'],
  ['code', 'class(flu_fcast) #Check what is returned'],
  ['code', 'flu_fcast'],
  ['text', "Now we'll construct new x-y series to vizualize."],
  ['text', "Note that we will generate the x-variables via seq() function."],
]

arime_prediction_content_two = [
  ['text', "length.out=ahead means to generate up to ahead variable (which we set to be 104 ahead). by='1 week' specifis that we want to increment by one week at a time."],
  ['code', 'newx = c(rev(seq(cleanedFluData$Date[1], length.out=ahead, by="1 week")), cleanedFluData$Date)'],
  ['text', 'We simply append the forecast data for the new y.'],
  ['code', 'newy = c(flu_fcast$pred, cleanedFluData$World)'],
  ['text', 'We then generate raw plot.'],
  ['code', 'par(mfrow=c(1, 1))'],
  ['code', 'plot.new()'],
  ['code', 'plot(newx, newy, type = "l", xlab = "weeks", ylab = "values", col=\'brown\',
     main = "World Flu Trend Plot including the 52-week forecast")'],
]

arime_prediction_content_three = [
  ['text', "Plot over the old plot for the new data point to make it easier to see."],
  ['code', 'points(newx[1:ahead], flu_fcast$pred, col = "red", type = "l", lwd=5)'],
  ['text', 'We simply append the forecast data for the new y.'],
  ['text', 'Add in the Standard Error curve.'],
  ['code', 'points(newx[1:ahead], rev(flu_fcast$pred - 2*flu_fcast$se), col = "blue", type = "l", lwd=3)'],
  ['code', 'points(newx[1:ahead], rev(flu_fcast$pred + 2*flu_fcast$se), col = "blue", type = "l", lwd=3)'],
  ['text', 'How does the prediction look?'],
  ['text', 'The blue lines represent the relatively possible outcomes (SE lines). You might have noticed that the SE lines expand extremely rapidly'],
  ['text',' This tells us that the model loses a lot of predictive confidence relatively fast.'],
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

############### Predicting via ARIMA ##############

arime_evaluation_content_one = [
  ['code', "par(mfrow=c(2, 1))"],
  ['text', "Let's look at the ACF of the RESIDUALS of the model (rememver that we already looked at the ACF of the raw data)."],
  ['code', 'acf(flu_arima$resid, lag.max = 160, main ="ACF of fitted residuals")'],
  ['code', 'pacf(flu_arima$resid, lag.max = 160, main = "PACF of fitted residuals")'],
  ['code', 'tsdiag(flu_arima)'],
  ['text', "Now we'll construct new x-y series to vizualize."],
  ['text', "Note that we will generate the x-variables via seq() function."],
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

################################################################################
##############  Construct ARIMA model  #########################################
################################################################################


conclusion_content = [
  ['text', "Write some conclusion breh"],
  ['text', ""],
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
















