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

#################################################################################
##### Scrape Data Lesson ########################################################
#################################################################################

collect_data_content_0 = [
  ['text', "Context: You're trying to get your feet wet with automated trading systems."],
  ['text', "The first thing you decide to do is to collect relevant financial data."],
  ['text', "You decide to scrape YAHOO finance historical data:"],
  ['link', "http://real-chart.finance.yahoo.com/table.csv?s=YHOO&d=7&e=1&f=2014&g=d&a=3&b=12&c=2000&ignore=.csv"],
  ['text', "Note that the link contains a series of parameters. You may or may not want to alter them."],
  ['text', "Now, write a script that will iterate collect all stock symbols listed on NYSE."],
  ['text', "You're not given specific language requirement, but if you're unfamiliar with the work, we suggest Python."],
]

collect_data_content_1 = [
  ['text', "Now submit the code you used to collect the YAHOO data."],
  ['text', "If your code refers/reads an external file/csv, explain in the comment what you expect the file to contain."],
  ['code_response', ""],
  ['text', "Make sure to include relevant coments."],
]

collect_data_lesson = Lesson.create!(
  title: "Data Collection",
  project: project,
  lesson_id: 1,
)

collect_data_slide_0 = Slide.create!(
  content: collect_data_content_0,
  parent: collect_data_lesson,
  slide_id: 0,
)

collect_data_slide_1 = Slide.create!(
  content: collect_data_content_1,
  parent: collect_data_lesson,
  slide_id: 1,
)

sraper_data_submission = SubmissionContext.create!(
  title: "Scraping Yahoo Finance",
  description: "User is asked to scrape Yahoo Finance.",
  slide: collect_data_slide_1,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)








