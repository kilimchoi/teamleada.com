main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"Intro to MATLAB",
  description: main_page_content,
  short_description: "This data project focuses on introducing users to MATLAB and creating a simple classifier for recordings of patients performing a visual categorization task.",
  number: 10,
  enabled: false,
  uid: 10,
  difficulty: 'Beginner',
  category: Project::COMING_SOON,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
