# Creates the anscombe project on the site!

main_page_content = [
  ['text', 'In this Lesson, we\'ll be working with a few special datasets, which have interesting properties.'],
  ['text', 'This is actually a well-known dataset; R has them installed by default.']
  ['text', 'Let\'s just take a look at the dataset.']
  ['code', 'anscombe']
  ['text', 'What do you see? Anythign specific? Don\'t worry, we\'ll dig in deeper!']
  ['text', 'Happy exploring!'],
]

project = Project.create!(
  title: "Anscombe",
  description: main_page_content,
  number: 1,
  enabled: true
)

################################################################################
puts "Created project: #{project.title}."

work_with_data_content = [
  ['text', 'In this project, we\'re given four datasets'],
  ['text', 'We\'ll quickly go over an exploratoray data analysis step'],
  ['lesson_links', nil],
]

work_with_data_lesson = Lesson.create!(
  title: "Explore The Datasets",
  project: project
)

work_with_data_slide_one = Slide.create!(
  content: work_with_data_content,
  parent: work_with_data_lesson
)
################################################################################

##Data One
data_one = data.frame(x=c(anscombe$x1),y=c(anscombe$y1))
summary(data_one$x)
summary(data_one$y)
#What do you notice?

data_one_pre_content = [
  ['text', 'We\'re going to create a dataframe called data_one via data.frame()'],
  ['code', 'help(data.frame) #documentation for data.frame()'],
  ['code', 'data_one = data.frame(x=c(anscombe$x1),y=c(anscombe$y1))'],
  ['code', 'summary(data_one$x)'],
  ['code', 'If you want to look at the entire dataset just type'],
  ['text', '#What do you notice?'],
  ['next_steps', nil],
]

data_one_pre_step = Step.create!(
  title: "Data One",
  lesson: work_with_data_lesson
)

train_data_slide_one = Slide.create!(
  content: data_one_pre_content,
  parent: data_one_pre_step
)


################################################################################
data_two_pre_step = Step.create!(
  title: "Data One",
  lesson: work_with_data_lesson
)

data_two_pre_step = Step.create!(
  title: "Data One",
  lesson: work_with_data_lesson
)

data_one_pre_step = Step.create!(
  title: "Data One",
  lesson: work_with_data_lesson
)




