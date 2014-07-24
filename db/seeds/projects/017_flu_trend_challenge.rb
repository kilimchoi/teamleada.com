
main_page_content = [
  ['text', "In this project, we'll build off of the flu trend project."],
  ['text', "You're given a new dataset to build a new time series model."],
  ['text', "You're given a timeframe, as well as a submission count limit"],
  ['text', "You'll be evaluated on the complexity of the model and also the accuracy of your predictions"],
]

project = Project.create!(
  title:"Time Series Challenge",
  description: main_page_content,
  short_description: "A project where you'll ",
  number: 17,
  enabled: true,
  uid: 17,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################



