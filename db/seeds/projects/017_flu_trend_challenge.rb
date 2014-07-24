
main_page_content = [
  ['text', "In this project, we'll build off of the flu trend project."],
  ['text', "You're given a new dataset to build a new time series model."],
  ['text', "You're given a timeframe, as well as a submission count limit"],
  ['text', "You'll be evaluated on the complexity of the model and also the accuracy of your predictions"],
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



