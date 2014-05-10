


main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"March Madness Analysis w/ SQL",
  description: main_page_content,
  short_description: "A data project that focuses on introducing you SQL, you will learn how to retrieve data from a database by writing SQL queries. Emphasis is on all things SQL, from creating filters, to ordering your results, to creating joins. You will ultimately discover some interesting metrics about March Madness results from the past two decades.",
  number: 7,
  enabled: true,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
