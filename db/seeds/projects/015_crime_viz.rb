
main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"Vizualizing Crime Data",
  description: main_page_content,
  short_description: "A data project focused on vizualization and reporting. You'll be given a set of recent San Francisco crime data. You'll be reponsible for creating meaninful vizualizations and reporting your analysis.",
  number: 15,
  enabled: true,
  uid: 15,
  difficulty: 'Advanced',
  category: Project::COMING_SOON,
  is_new: false,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

content_one = [
  ['link', 'https://data.sfgov.org/Public-Safety/SFPD-Incidents-Previous-Three-Months/tmnf-yvry?'],
]
