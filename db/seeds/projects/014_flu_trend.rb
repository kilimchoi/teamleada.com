
main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"Analyzing Flu Trend",
  description: main_page_content,
  short_description: "A data project focused on analyzing trend data. We'll be building time series model to make predictions on flu trend.",
  number: 14,
  enabled: true,
  uid: 14,
  difficulty: 'Intermediate',
  category: Project::COMING_SOON,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
