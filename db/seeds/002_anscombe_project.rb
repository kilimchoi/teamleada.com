# Creates the anscombe project on the site!

main_page_content = [
  ['text', 'In this Lesson, we\'ll be working with a few special datasets, which have interesting properties.'],
  ['text', 'This is actually a well-known dataset; R has them installed by default.'],
  ['text', 'Let\'s just take a look at the dataset.'],
  ['code', 'anscombe'],
  ['text', 'What do you see? Anything specific? Don\'t worry, we\'ll dig in deeper!'],
  ['text', 'Happy exploring!']
]

project = Project.create!(
  title: "Anscombe",
  description: main_page_content,
  number: 1,
  enabled: true
)

################################################################################
puts "Created project: #{project.title}."
################################################################################
#Main Page
work_with_data_pre_content = [
  ['text', 'In this project, we\'re given four datasets'],
  ['text', 'We\'ll quickly go over an exploratoray data analysis step'],
  ['lesson_links', nil]
]

work_with_data_pre_lesson = Lesson.create!(
  title: "Explore The Datasets",
  project: project
)

work_with_data_slide_one = Slide.create!(
  content: work_with_data_pre_content,
  parent: work_with_data_pre_lesson
)
################################################################################

data_one_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_one via data.frame()'],
  ['code', 'help(data.frame) #documentation for data.frame()'],
  ['code', 'data_one = data.frame(x=c(anscombe$x1),y=c(anscombe$y1))'],
  ['code', 'summary(data_one$x)'],
  ['code', 'summary(data_one$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look another dataset'],
  ['next_steps', nil]
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
  ['code', 'summary(data_two$x)'],
  ['code', 'summary(data_two$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look another dataset'],
  ['next_steps', nil]
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
  ['code', 'summary(data_three$x)'],
  ['code', 'summary(data_three$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look another dataset'],
  ['next_steps', nil]
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
  ['code', 'data_four = data.frame(x=c(anscombe$x3),y=c(anscombe$y3))'],
  ['code', 'summary(data_four$x)'],
  ['code', 'summary(data_four$y)'],
  ['text', 'What do you notice? Nothing specific? Let\'s look another dataset'],
  ['next_steps', nil]
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
  ['text', 'In this section, we\'ll first (blindly) fit a Linear Model and compare them.'],
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
  ['text', 'Here User will compare the 2 data sets. We\'ll do Dataset 1 and Dataset 2, but feel free to do other comparison'],
  ['text', 'We\'re going to rename the data here. Insert whatever data you want to compare, and rename as below:'],
  ['code', 'compare_one = data_one #change data_one to another data set (data_one ~ data_four)'],
  ['code', 'compare_two = data_two #same thing applies here. Just make sure they\'re not the same data!'],
  ['text', 'Now, against our better judgement, let\'s not compare the dataset first, but rather fit a model.'],
]

fit_lm_content_two = [
  ['text', 'We\'re going to fit a Linear Regression to see how it behaves.'],
  ['text', 'We\'ll be using the lm() function):'],
	['code', 'help(lm)'],
  ['code', 'linear.mod1 = lm(y ~ x, data = compare_one) #linear model for the first data set'],
  ['text', 'linear.mod2 = lm(y ~ x, data = compare_two) #linear model for the second data set'],
]

fit_lm = Step.create!(
  title: "Fit Linear Models",
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
  ['text', 'Let\'s inspect the model (press ENTER in the terminal to see next plot):'],
  ['code', 'plot(linear.mod1, col = \'blue\', lwd=3)'],
  ['code', 'plot(linear.mod2, col = \'orange\', lwd=3)'],
  ['text', 'You don\'t have to understand what the plots mean. The important question is:'],
  ['text', '"Did they look different?".'],
  ['text', 'Now we\'re getting somewhere.'],
  ['text', 'What does your intuition say? Something is fishy... Let\'s now compare the data.'],
  ['text', 'We should have done that a long time ago!']
]

lm_analysis_content_two = [
  ['text', 'We\'ll now plot both data point on the same page.'],
  ['code', 'plot(compare_one, col=\'blue\', pch=19)'],
  ['code', 'points(compare_two, col=\'green\', pch=19)'],
  ['code', 'abline(linear.mod1, col = \'red\', lwd=3)'],
  ['text', 'abline(linear.mod2, col=\'orange\', lwd=5)'],
  ['text', 'You can click the back-arrow in the plot to see that the regression lines are the same!'],
]

lm_analysis_content_three = [
  ['text', 'Inspecting the summary of the model, we see that the lines share the SAME intercept and slope!'],
  ['code', 'summary(linear.mod1)'],
  ['code', 'summary(linear.mod2)'],
  ['text', 'They both share an intercept of about 3, with a slope of 0.5.'],
  ['text', 'What did we learn? Perhaps we can\'t simply rely on summary statistics and models to tell us data-stories;'],
  ['text', 'We have to be more careful.'],
  ['text', 'With that in mind, we\'ll now do a correct analysis on each dataset.'],
  ['project_link', 'Back to the lessons page'],
]

analyze_lm = Step.create!(
  title: "Analyze LM result",
  lesson: lm_comparison_content_lesson
)

learn_ctree_slide_one = Slide.create!(
  content: lm_analysis_content_one,
  parent: analyze_lm
)

learn_ctree_slide_two = Slide.create!(
  content: lm_analysis_content_two,
  parent: analyze_lm
)

learn_ctree_slide_two = Slide.create!(
  content: lm_analysis_content_three,
  parent: analyze_lm
)