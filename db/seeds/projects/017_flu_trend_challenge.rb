
main_page_content = [
  ['text', "In this project, we'll build off of the flu trend project."],
  ['text', "- You're given a new dataset to build a new time series model."],
  ['text', "- You're given a timeframe, as well as a submission count limit"],
  ['text', "- You'll be evaluated on the complexity of the model and also the accuracy of your predictions"],
  ['text', "Good Luck!"],
]

project = Project.create!(
  title:"Time Series Challenge",
  description: main_page_content,
  short_description: "This is a project where you'll be asked to build a time series model on a piece of data. You're free to use any package or language. You'll be judged on the accuracy of the model as well as the complexity of the model",
  number: 17,
  enabled: true,
  uid: 17,
  has_leaderboard: true,
  has_submit: true,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
main_page_content = [
  ['text', 'The premise of the project is as follows:'],
  ['text', "- You are given 3 datasets."],
  ['text', "- You're asked to fit a time series model on 2 of them (choose 2, and you can ignore the rest)."],
  ['text', "- You'll have to create a prediction over the next 100 periods on both of the datasets you chose."],
  ['text', "- Lastly, you're asked to writeup/present your process."],
  ['text', "- You'll receive a a score on "],
  ['lesson_links', nil],
]

main_page_lesson = Lesson.create!(
  title: "Time Series Challenge: Context",
  project: project,
  lesson_id: 0,
)

main_page_slide = Slide.create!(
  content: main_page_content,
  parent: main_page_lesson,
  slide_id: 0,
)
