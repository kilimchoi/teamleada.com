
main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"March Madness Analysis w/ SQL",
  description: main_page_content,
  short_description: "This data project focuses on using SQL, you will learn how to retrieve data from a database by writing SQL queries. Other skills you will learn is how to create filters, how to order your results, and creating table joins. You will ultimately discover some interesting metrics about March Madness results from the past two decades.",
  number: 7,
  enabled: false,
  uid: 7,
  difficulty: 'Advanced',
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
