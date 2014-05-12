# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'In this Lesson, we\'ll be working with a few special datasets, which have interesting properties.'],
  ['text', 'This is actually a well-known dataset; R has them installed by default.'],
  ['text', 'Let\'s just take a look at the dataset.'],
  ['code', 'anscombe'],
  ['text', 'What do you see? Anything specific? Don\'t worry, we\'ll dig in deeper!'],
  ['text', 'Happy exploring!']
]

project = Project.create!(
  title: "Anscombe's Quartet",
  description: main_page_content,
  short_description: "An introductory data project hosted by Leada which familiarizes you with R syntax and creating basic linear models on a dataset. This project is for first time programmers wanting to get introduced to the world of statistical and data analysis.",
  number: 3,
  enabled: true,
  codename: "anscombes_quartet"
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
##PRE: Analyze data IN-properly
work_with_data_pre_content = [
  ['text', 'In this project, we\'re given four datasets.'],
  ['text', 'We\'ll quickly go over an exploratoray data analysis step.'],
  ['lesson_links', nil]
]

work_with_data_pre_lesson = Lesson.create!(
  title: "Explore The Datasets",
  project: project
)

work_with_data_pre_slide_one = Slide.create!(
  content: work_with_data_pre_content,
  parent: work_with_data_pre_lesson
)
################################################################################

data_one_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_one using the data.frame() function'],
  ['code', 'help(data.frame)'],
  ['code', 'data_one = data.frame(x=c(anscombe$x1),y=c(anscombe$y1))'],
  ['text', 'We access the resulting dataframe\'s column x1 and y1 via the "$" operator.'],
  ['code', 'summary(data_one$x)'],
  ['code', 'summary(data_one$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look at another dataset.'],
  ['next_steps', nil],
]

data_one_pre_step = Step.create!(
  title: "Data One",
  lesson: work_with_data_pre_lesson
)

train_data_slide_one = Slide.create!(
  content: data_one_pre_content,
  parent: data_one_pre_step
)


################################################################################
data_two_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_two via data.frame()'],
  ['code', 'help(data.frame) #documentation for data.frame()'],
  ['code', 'data_two = data.frame(x=c(anscombe$x2),y=c(anscombe$y2))'],
  ['text', 'We access the anscombe dataframe\'s column x2 and y2 via the "$" operator.'],
  ['code', 'summary(data_two$x)'],
  ['code', 'summary(data_two$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look at another dataset.'],
  ['next_steps', nil],
]

data_two_pre_step = Step.create!(
  title: "Data Two",
  lesson: work_with_data_pre_lesson
)

train_data_slide_two = Slide.create!(
  content: data_two_pre_content,
  parent: data_two_pre_step
)

################################################################################
data_three_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_three via data.frame()'],
  ['code', 'help(data.frame) #documentation for data.frame()'],
  ['code', 'data_three = data.frame(x=c(anscombe$x3),y=c(anscombe$y3))'],
  ['text', 'We access the anscombe dataframe\'s column x3 and y3 via the "$" operator.'],
  ['code', 'summary(data_three$x)'],
  ['code', 'summary(data_three$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look at another dataset.'],
  ['next_steps', nil],
]

data_three_pre_step = Step.create!(
  title: "Data Three",
  lesson: work_with_data_pre_lesson
)

train_data_slide_three = Slide.create!(
  content: data_three_pre_content,
  parent: data_three_pre_step
)

################################################################################
data_four_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_four via data.frame()'],
  ['code', 'help(data.frame) #documentation for data.frame()'],
  ['code', 'data_four = data.frame(x=c(anscombe$x4),y=c(anscombe$y4))'],
  ['text', 'We access the anscombe dataframe\'s column x4 and y4 via the "$" operator.'],
  ['code', 'summary(data_four$x)'],
  ['code', 'summary(data_four$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look at another dataset.'],
  ['next_steps', nil],
]

data_four_pre_step = Step.create!(
  title: "Data Four",
  lesson: work_with_data_pre_lesson
)

train_data_slide_four = Slide.create!(
  content: data_four_pre_content,
  parent: data_four_pre_step
)
################################################################################

#LM comparison master [LOCKED]
lm_comparison_content = [
  ['text', 'In this section, we\'ll first (blindly) fit Linear Models and compare them.'],
  ['text', 'We\'ll then go in-depth about understanding what happened.'],
  ['lesson_links', nil]
]

lm_comparison_content_lesson = Lesson.create!(
  title: "Analysis via Linear Models",
  project: project
)

lm_comparison_content_slide_one = Slide.create!(
  content: lm_comparison_content,
  parent: lm_comparison_content_lesson
)

################################################################################
#LM  comparison #1
fit_lm_content_one = [
  ['text', 'Here we\'ll compare 2 datasets. We\'ll do dataset 1 and dataset 2, but feel free to do other comparisons'],
  ['text', 'We\'re going to rename the data here. Insert whatever data you want to compare, and rename as below:'],
  ['code', 'compare_one = data_one #change data_one to another data set (data_one through data_four)'],
  ['code', 'compare_two = data_two #same thing applies here. Just make sure they\'re not the same data as above!'],
  ['text', 'Now, against our better judgements, let\'s NOT first compare/vizualize the dataset, but rather fit a model.'],
  ['text', 'We\'re going to fit a Linear Regression Model to see how it behaves.'],
]

fit_lm_content_two = [
  ['text', 'We\'ll be using the lm() function:'],
	['code', 'help(lm) #to learn more about the model'],
  ['code', 'linear.mod1 = lm(y ~ x, data=compare_one) #linear model for the first data set'],
  ['code', 'linear.mod2 = lm(y ~ x, data=compare_two) #linear model for the second data set'],
  ['text', 'Now let\'s see what the lines look like.'],
  ['code', 'plot(c(0, 10), c(0, 10) , type="n", axes=T, xlab="", ylab="") #we\'ll start with an empty plot.'],
  ['code', 'abline(linear.mod1, col = \'red\', lwd=3) #adding the fitted line for the 1st linear model.'],
  ['code', 'abline(linear.mod2, col=\'orange\', lwd=5) #adding the fitted line for the 2nd linear model.'],
  ['text', 'What happened? Let\'s dig in deeper in the next step.'],
  ['next_steps', nil],
]

fit_lm = Step.create!(
  title: "Fitting Linear Models",
  lesson: lm_comparison_content_lesson
)

fit_lm_slide_one = Slide.create!(
  content: fit_lm_content_one,
  parent: fit_lm
)

fit_lm_slide_two = Slide.create!(
  content: fit_lm_content_two,
  parent: fit_lm
)
################################################################################
#LM  comparison #1
lm_analysis_content_one = [
  ['text', 'Let\'s inspect the model (press ENTER in the terminal to see the next plots):'],
  ['code', 'plot(linear.mod1, col = \'blue\', lwd=3)'],
  ['code', 'plot(linear.mod2, col = \'orange\', lwd=3)'],
  ['text', 'You don\'t have to understand what the plots mean.'],
  ['text', 'The important question is: "Did they look different?"'],
  ['text', 'Now we\'re getting somewhere.'],
  ['text', 'What does your intuition say? Something is fishy... Let\'s now compare the data.'],
  ['text', 'We should have done that from the beginning!']
]

lm_analysis_content_two = [
  ['text', 'We\'ll now plot both data points on the same page.'],
  ['code', 'plot(compare_one, col=\'blue\', pch=19)'],
  ['code', 'points(compare_two, col=\'green\', pch=19)'],
  ['code', 'abline(linear.mod1, col = \'red\', lwd=3)'],
  ['code', 'abline(linear.mod2, col=\'orange\', lwd=5)'],
  ['text', 'You can click the back-arrow in the plot-area to see that the regression lines are the same!'],
]

lm_analysis_content_three = [
  ['text', 'Inspecting the summary of the model, we see that the lines share the SAME intercept and slope!'],
  ['code', 'summary(linear.mod1)'],
  ['code', 'summary(linear.mod2)'],
  ['text', 'They both share an intercept of about 3, with a slope of 0.5.'],
  ['text', 'What did we learn?'],
  ['text', 'Perhaps we can\'t simply rely on summary statistics and models to tell us data-stories.'],
  ['text', 'We have to be more careful.'],
  ['text', 'With that in mind, we\'ll now do a correct analysis on each dataset.'],
  ['next_steps', nil],
]

analyze_lm = Step.create!(
  title: "Analyze LM result",
  lesson: lm_comparison_content_lesson
)

analyze_lm_slide_one = Slide.create!(
  content: lm_analysis_content_one,
  parent: analyze_lm
)

analyze_lm_slide_two = Slide.create!(
  content: lm_analysis_content_two,
  parent: analyze_lm
)

analyze_lm_slide_three = Slide.create!(
  content: lm_analysis_content_three,
  parent: analyze_lm
)
################################################################################
#POST: Analyze data properly

work_with_data_post_content = [
  ['text', 'Now that we see what we did wrong, we\'ll properly analyze the data here.'],
  ['text', 'In the earlier steps, we relied on summary statistics and powerful (or not) models.'],
  ['text', 'This time, we\'ll start with the correct fundamental step: vizualization.'],
  ['lesson_links', nil]
]

work_with_data_post_lesson = Lesson.create!(
  title: "Correct Analysys of the Datasets",
  project: project
)

work_with_data_post_slide_one = Slide.create!(
  content: work_with_data_post_content,
  parent: work_with_data_post_lesson
)
################################################################################

data_one_post_content_one = [
  ['text', 'We\'ll start with plotting the data'],
  ['code', 'data_one = data.frame(x=c(anscombe$x1),y=c(anscombe$y1))'],
  ['code', 'plot(data_one, col=\'green\', pch=15)'],
  ['text', 'WOOT! This dataset actually seems like a good candidate for a linear model! Let\'s see what happens.'],
  ['text', 'We\'ll fit a linear model via the lm() function.'],
]
data_one_post_content_two = [
  ['code', 'linear_model_one = lm(y ~ x, data = data_one)'],
  ['text', 'Let\'s now plot the fit line.'],
  ['code', 'abline(linear_model_one, col = \'blue\', lwd=3)'],
  ['text', 'This looks good! But how good? We\'ll learn to do better evaluation in future projects.'],
  ['next_steps', nil],
]

data_one_post_step = Step.create!(
  title: "(proper) Data One",
  lesson: work_with_data_post_lesson
)

data_one_post_slide_one = Slide.create!(
  content: data_one_post_content_one,
  parent: data_one_post_step
)
data_one_post_slide_two = Slide.create!(
  content: data_one_post_content_two,
  parent: data_one_post_step
)

################################################################################
data_two_post_content_one = [
  ['text', 'We\'ll again start with plotting the data.'],
  ['code', 'data_two = data.frame(x=c(anscombe$x2),y=c(anscombe$y2)) #generate the dataframe in case you haven\'t'],
  ['code', 'plot(data_two, col=\'blue\', pch=16)'],
  ['text', 'Does it look polynomial? Yes! (2nd order, but not important here). So how do you fit it in R?'],
  ['text', 'We can tell you exactly how, or we can tell you how to figure out how.'],
  ['text', '-1: Get to google.com'],
  ['text', '-2: Search: "how to fit polynomial in R"'],
  ['text', '-3: Check out the first result that refers "stackoverflow.com/..."'],
  ['text', 'Woah! It features the same exact question that you had!'],
]

data_two_post_content_two = [
  ['text', 'For the lazies:'],
  ['link', 'http://stackoverflow.com/questions/3822535/fitting-polynomial-model-to-data-in-r'],
  ['text', 'The top answer (accepted with a green check) offers the following solution:'],
  ['code', 'large_polynomial_fit = lm(y ~ x + I(x^2) + I(x^3), data=data_two)'],
  ['code', 'large_polynomial_fit'],
  ['text', 'This seems to be for 3rd order polynomials. How do we fix it? Simply remove the larger order!'],
  ['code', 'quadratic_fit = lm(y ~ x + I(x^2), data=data_two)'],
  ['code', 'quadratic_fit #call summary(polynomial_fit) for more details!']
]

data_two_post_content_three = [
  ['text', 'By default, the trained model only has x-values from the original data set. That\'s about 11 values.'],
  ['text', 'We\'ll manually ask the model to predict 1000 granular data points and conncet them as a line.'],
  ['text', 'We\'ll first generate the granular x-values. We\'ll use seq() to achieve that. But what does seq() do?'],
  ['code', 'help(seq) #now you know!'],
  ['code', 'xvalues = seq(4, 14, 0.01)'],
  ['text', '"xvalues" now represents a list of numbers from 4 to 14, each incrementing by 0.01'],
  ['text', 'Now we\'ll calculate the predicted y (known as y-hat).'],
  ['code', 'help(predict) #This help() is a bit vague, so don\'t worry too much about it.'],
  ['code', 'fitted_yhat = predict(quadratic_fit, data.frame(x=xvalues))'],
  ['text', 'Now we have the 1000 predicted points.'],
]

data_two_post_content_four = [
  ['text', 'We\'ll add in the fitted points from the ORIGINAL data in RED.'],
  ['code', 'points(data_two$x, predict(quadratic_fit), type="p", col="red", lwd=3)'],
  ['text', 'Note that they overlap perfectly!'],
  ['text', 'Now to add the 1000 granular predictions as a line.'],
  ['code', 'lines(x=xvalues, y=fitted_yhat, lwd=2, col="darkgray")'],
  ['text', 'VOILA! Perfect fit. It\'s as if it was meant to fit that well.'],
  ['text', 'Remember the old days when we tried to fit a linear model? Pepperidge Farm remembers...'],
  ['next_steps', nil],
]

data_two_post_step = Step.create!(
  title: "(proper) Data Two",
  lesson: work_with_data_post_lesson
)
data_two_slide_one = Slide.create!(
  content: data_two_post_content_one,
  parent: data_two_post_step
)
data_two_slide_two = Slide.create!(
  content: data_two_post_content_two,
  parent: data_two_post_step
)
data_two_slide_three = Slide.create!(
  content: data_two_post_content_three,
  parent: data_two_post_step
)
data_two_slide_four = Slide.create!(
  content: data_two_post_content_four,
  parent: data_two_post_step
)

################################################################################
data_three_post_content_one = [
  ['text', 'Again we\'ll start with plotting the data'],
  ['code', 'data_three = data.frame(x=c(anscombe$x3),y=c(anscombe$y3))'],
  ['code', 'plot(data_three, col=\'orange\',pch=17, main="original data_three") #what is "main="? See help(plot)'],
  ['text', 'What do you see? Perhaps that yellow triangle at the top right corner? Yup, we see it too.'],
  ['text', 'Could it possibly be an outlier? We\'ll figure that out with the good old box-plot.'],
  ['code', 'help(boxplot)'],
  ['code', 'boxplot(data_three, main="box-plot for data_three")'],
  ['text', 'Yup, an outlier! The circle denoted for "y" indicates outlier.'],
  ['text', 'What is your gut telling you to do? *try removing the outlier*'],
]
data_three_post_content_two = [
  ['text', 'For now, we will do this manually.'],
  ['text', 'If the dataset was big, manual removal of outliers will perhaps best be saved for pranking the interns.'],
  ['text', 'What value of x yields the outlier?'],
  ['text', 'We think that the row/index 3 with x=13 and y=12.74 seems to be the culprit.'],
  ['text', 'We found it by finding the highest y-value. You can try it if you\'re curious. (try using max() on the y-column.)'],
  ['text', 'We\'ll then use negative notation to subset that particular data point.'],
  ['code', 'cleaned_data_three = data_three[-3,]'],
  ['text', 'What we did is similar to how we used to subset data. We used a bracket notation to specify a row.'],
  ['text', 'We simply added a negative sign (or minus) in front of the index to tell R:'],
  ['text', '"Return the entire dataset WITHOUT the specified index"'],
]
data_three_post_content_three = [
  ['text', 'Inspect and then plot the result:'],
  ['code', 'cleaned_data_three'],
  ['code', 'plot(cleaned_data_three, col=\'orange\', pch=17, main="cleaned data_three")'],
  ['text', 'Hmm, perhaps we can now fit a linear model??'],
  ['code', 'linear_model_three = lm(y ~ x, data = cleaned_data_three)'],
  ['text', 'Let\'s add the new fitted line.'],
  ['code', 'abline(linear_model_three, col = \'blue\', lwd=3)'],
  ['text', 'Beautiful.'],
  ['next_steps', nil],
]
data_three_post_step = Step.create!(
  title: "(proper) Data Three",
  lesson: work_with_data_post_lesson
)
data_three_slide_one = Slide.create!(
  content: data_three_post_content_one,
  parent: data_three_post_step
)
data_three_slide_two = Slide.create!(
  content: data_three_post_content_two,
  parent: data_three_post_step
)
data_three_slide_three = Slide.create!(
  content: data_three_post_content_three,
  parent: data_three_post_step
)
################################################################################
data_four_post_content_one = [
  ['text', 'We\'ll again start with plotting the data'],
  ['code', 'data_four = data.frame(x=c(anscombe$x4),y=c(anscombe$y4))'],
  ['code', 'data_four'],
  ['code', 'plot(data_four,col=\'red\', pch=18, main="data_four original")'],
  ['text', 'What do you think?'],
  ['text', 'We could do a box plot.'],
  ['text', 'But does it make sense? You can try.'],
  ['text', 'The red dot on the top right corner is clearly an outlier.'],
  ['text', 'Should we remove it?'],
  ['text', 'hmm'],
  ['text', 'hmm'],
]

data_four_post_content_two = [
  ['text', 'What will happen if we remove the outlier? (replot the data if you haven\'t):'],
  ['text', 'We\'ll end up with a vertical line at x=8'],
  ['text', 'This is a tricky one. Take a moment and think about this data.'],
  ['text', 'Pondering on the issue will (hopefully) help you harvest your curiousity/intution.'],
  ['text', 'Our thoughts:'],
  ['text', 'You might not realize right away, but this dataset actually wasn\'t even meant to be fit with a simple linear model.'],
  ['text', 'It is most likely a categorical dataset, with multiple observation at category-x=8, and one observation at category-x=19.'],
]

data_four_post_content_three = [
  ['text', 'For example, this could be a survey on the number of cat whiskers in certain cat categories.'],
  ['text', 'x=8 can represent derpy cats (Apparently We observed 10 of these cats, 2 of which is in the link...):'],
  ['link', 'http://i.imgur.com/N9eZrMK.gif'],
  ['text', 'x=19 can represents majestic-evil cats (and we observed only one of these cats)'],
  ['link', 'http://i.imgur.com/JM6dTOC.jpg'],
  ['text', 'There is no way to tell. But it doens\'t make sense to throw a linear model at this data.'],
  ['text', 'Ultimately, linear models are powerful tools.'],
  ['text', 'But you have to keep in mind that you can\'t simply throw data into a model and expect results.'],
]

data_four_post_content_four = [
  ['text', 'If you were to do real analysis here, you\'d need a certain level of domain expertise:'],
  ['text', 'Maybe we can compare the difference in whisker length. We first look at the lengths for x=8 (derpy cats)'],
  ['code', 'summary(data_four$y[data_four$x==8]) #we\'re taking summary of length for x==8.'],
  ['text', 'How are the length for derpy cats distributed?'],
  ['code', 'plot(density(data_four$x), main="distribution of whisker length for derpy cats")'],
  ['text', '"Distributions" will come up again, and you\'ll get used to seeing the weird curvy graph.'],
  ['text', 'In the mean time, check it out:'],
  ['code', 'help(density) #don\'t worry too much about this function, just get a feel for it.'],
  ['text', 'For x=19 (majestic-evil cats), we don\'t have enough data point (we only saw one cat!)'],
  ['text', 'Perhaps our next move is to go find more data for x=19.'],
  ['next_steps', nil],
]

data_four_post_step = Step.create!(
  title: "(proper) Data Four",
  lesson: work_with_data_post_lesson
)
data_four_slide_one = Slide.create!(
  content: data_four_post_content_one,
  parent: data_four_post_step
)
data_four_slide_two = Slide.create!(
  content: data_four_post_content_two,
  parent: data_four_post_step
)
data_four_slide_three = Slide.create!(
  content: data_four_post_content_three,
  parent: data_four_post_step
)
data_four_slide_four = Slide.create!(
  content: data_four_post_content_four,
  parent: data_four_post_step
)

################################################################################
#Cnclusion
conclusion_content_one = [
  ['text', 'How could this have happened? You looked at 4 datasets and it seems like the usual statistical methods have deceived you.'],
  ['text', 'We have 4 different datasets; if we didn\'t inspect them carefully, we would have never learned about their differences.'],
  ['text', 'This leaves us with one final message: "Look at your data".'],
  ['text', 'A quote from Josh Wills (Senior Director of Data Science at Cloudera):'],
  ['text', '"People who learn about t-tests and regressions get a little sophisticated, and start applying models without looking at the data. They think that they can just apply this technique and they don’t have to look at the data anymore. You do that a few times, you get burned by some bad data, and you learn to go back and start looking at the data again."'],
  ['project_link', 'Back to the lessons page'],
]

conclusion_lesson = Lesson.create!(
  title: "Anscombe Conclusion",
  project: project
)
work_with_data_pre_slide_one = Slide.create!(
  content: conclusion_content_one,
  parent: conclusion_lesson
)



