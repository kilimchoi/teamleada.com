main_page_content = [
	['text', 'This is a pilot proj.'],
]

project = Project.create!(
  title:"Deploy a Model to the Cloud",
  description: main_page_content,
  short_description: "We\'ll build and deploy a simple machine learning model to the cloud. The model will be accessible from anywhere with an internet connection. Next time you're interviewing, offer to demo the model via their local machines. We guarantee they'll be impressed.",
  number: 9,
  enabled: true,
  paid: true,
  cost: 500
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
