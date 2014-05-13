main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"Create a Location Recommendation System",
  description: main_page_content,
  short_description: "Using data from the Bay Area Bike Share you will learn how to create a simple reccomendation algorithm for potential customers. This project will introduce you to Python for data analysis and machine learning. This project is for intermediate level students.",
  number: 8,
  enabled: false,
  uid: 8,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
