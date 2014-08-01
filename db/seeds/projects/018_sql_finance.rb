main_page_content = [
  ['text', "In this project we'll quickly scrape a set of YAHOO data, and store the scraped data into a SQL databse."],
  ['text', "The following are the steps you'll take to accomplish the task"],
  ['text', "1. Scrape YAHOO Finance Data."],
  ['text', "2. Store the scraped data locally"],
  ['text', "3. Design a SQL database to store the Data"],
  ['text', "4. Write a SQL script to load the data into the database"],
  ['text', "We'll use the SQL database in another project!"],
]

project = Project.create!(
  title:"Scraping and storing Financial Data [SQL]",
  description: main_page_content,
  short_description: "In this project, you'll quickly scrape a set of YAHOO finance data. Follwing the scrape, you'll store the data into SQL database. You'll use the database later for another SQL project!",
  number: 18,
  enabled: true,
  uid: 18,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 2.weeks,
)

################################################################################
#puts "============ Created project: #{project.title}."
#################################################################################

project_overview_content0 = [
  ['text', "In this project we'll quickly scrape a set of YAHOO data, and store the scraped data into a SQL databse."],
  ['text', "The following are the steps you'll take to accomplish the task"],
  ['text', "1. Scrape YAHOO Finance Data."],
  ['text', "2. Store the scraped data locally"],
  ['text', "3. Design a SQL database to store the Data"],
  ['text', "4. Write a SQL script to load the data into the database"],
  ['text', "We'll use the SQL database in another project!"],
  ['next_steps', nil],
]

project_overview = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

project_overview_slide0 = Slide.create!(
  content: project_overview_content0,
  parent: project_overview,
  slide_id: 0,
)








