main_page_content = [
  ['text', "In this project we'll quickly scrape a set of YAHOO data, and store the scraped data into a SQL databse."],
  ['text', "The following are the steps you'll take to accomplish the task."],
  ['text', "1. Scrape YAHOO Finance Data."],
  ['text', "2. Store the scraped data locally."],
  ['text', "3. Design a SQL database to store the Data."],
  ['text', "4. Write a SQL script to load the data into the database."],
  ['text', "We'll use the SQL database in another project!"],
  ['text-success', "Let's get started!"],
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
  ['text', "The following are the steps you'll take to accomplish the task."],
  ['text', "1. Scrape YAHOO Finance Data."],
  ['text', "2. Store the scraped data locally."],
  ['text', "3. Design a SQL database to store the Data."],
  ['text', "4. Write a SQL script to load the data into the database."],
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
  ['text-success', "Context: You're trying to get your feet wet with automated trading systems."],
  ['text', "The first thing you decide to do is to collect relevant financial data."],
  ['text', "You decide to scrape YAHOO finance historical data:"],
  ['link', "http://real-chart.finance.yahoo.com/table.csv?s=YHOO&d=7&e=1&f=2014&g=d&a=3&b=12&c=2000&ignore=.csv"],
  ['text', "Note that the link contains a series of parameters."],
  ['text', "You may or may not want to alter them."],
  ['text', "Now, write a script that will iteratively collect all stock symbols listed on NYSE."],
  ['text', "You're not given specific language requirement, but if you're unfamiliar with the work, we suggest Python."],
]

collect_data_content_1 = [
  ['text', "Now submit the code you used to collect the YAHOO data."],
  ['text', "If your code refers/reads an external file/csv, explain in the comment what you expect the file to contain."],
  ['user_code', ""],
  ['text-warning', "Make sure to include relevant comments."],
  ['next_steps', ""],
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

#################################################################################
##### SQL SCHEMA DESIGN/IMPLEMNT ################################################
#################################################################################

sql_overview_content = [
  ['text', "Now that you have the collected historical csv, you decide to stick the data into a SQL databse"],
  ['text', "We'll first talk about the database design."],
  ['text', "Once we design the database, we'll go ahead an implement the code that will import the csv into the database."],
  ['lesson_links', ""],
]

sql_lesson = Lesson.create!(
  title: "SQL Design/Implement",
  project: project,
  lesson_id: 2,
)
sql_overview_slide = Slide.create!(
  content: sql_overview_content,
  parent: sql_lesson,
  slide_id: 0,
)

#################################################################################

sql_design_content_one = [
  ['text', "We want to design a sql database that will hold all of our historical data."],
  ['text', "There are many different ways to store the data."],
  ['text', "However, you want to keep the schema as maintainable as possible."],
  ['text', "Forexample, you might want to add more comapny information later."],
  ['text', "Design a set of schemas that you're going to store the historical data points you scraped from YAHOO."],
  ['user_response', ""],
  ['text-warning', "Don't forget to spend 1 or 2 paragraphs explaining you reasonings."],
  ['next_steps', ""],
]

sql_design_step = Step.create!(
  title: "SQL Schema Design",
  lesson: sql_lesson,
  step_id: 0,
)

sql_design_slide = Slide.create!(
  content: sql_design_content_one,
  parent: sql_design_step,
  slide_id: 0,
)

sql_design_submission = SubmissionContext.create!(
  title: "Designing Financial Schema",
  description: "User is asked to design a schema to store the financial data scraped from YAHOO.",
  slide: sql_design_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

#################################################################################

sql_code_content_one = [
  ['text', "Now that you've designed it, code up the scheame."],
  ['text', "In addition to coding up the schema, also write a script that will load your scraped data into your schema."],
  ['user_code', ""],
  ['text-warn', "Make sure you've sufficiently commented in your code."],
  ['next_steps', ""],
]

sql_code_step = Step.create!(
  title: "SQL Code",
  lesson: sql_lesson,
  step_id: 1,
)

sql_code_slide = Slide.create!(
  content: sql_code_content_one,
  parent: sql_code_step,
  slide_id: 0,
)

sql_code_submission = SubmissionContext.create!(
  title: "Coding Financial Schema [SQL]",
  description: "User is asked to code/load schema to store the financial data scraped from YAHOO.",
  slide: sql_code_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

#################################################################################
##### SQL SCHEMA DESIGN/IMPLEMNT ################################################
#################################################################################

sql_conclusion_content = [
  ['text-success', "You've completed the SQL finance project!"],
  ['text', "Now you have a set of interesting data to work with."],
  ['text', "In a future project, we'll revisit the SQL database you created in order to do some fun analysis."],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

sql_lesson = Lesson.create!(
  title: "SQL/Finance Conclusion",
  project: project,
  lesson_id: 3,
)

sql_conclusion_slide = Slide.create!(
  content: sql_conclusion_content,
  parent: sql_lesson,
  slide_id: 0,
)

#################################################################################






