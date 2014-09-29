main_page_content = [
  ['text', "In this challenge you are tasked with quickly scraping a set of Yahoo data, and then storing the scraped data into a SQL database."],
  ['text', "The following are the steps you'll take to accomplish the task."],
  ['text', "1. Scrape Yahoo Finance data."],
  ['text', "2. Store the scraped data locally."],
  ['text', "3. Design a SQL database to store the data."],
  ['text', "4. Write a SQL script to load the data into the database."],
  ['text-success', "Let's get started!"],
]

project = Project.create!(
  title:"Storing Financial Data in a SQL Database",
  description: main_page_content,
  short_description: "In this challenge, you will scrape a set of Yahoo finance data. After collecting the data, you will design a database schema and then store it into a SQL database.",
  number: 18,
  enabled: false,
  has_written_submit: true,
  uid: 18,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 2.weeks,
  cover_photo: "scrape-finance",
)

################################################################################
#puts "============ Created project: #{project.title}."
#################################################################################

project_overview_content_0 = [
  ['text', "In this challenge you will quickly scrape a set of Yahoo data, and then store the scraped data into a SQL database."],
  ['text', "The following are the steps you'll take to accomplish the task."],
  ['text', "1. Scrape Yahoo Finance data."],
  ['text', "2. Store the scraped data locally."],
  ['text', "3. Design a SQL database to store the Data."],
  ['text', "4. Write a SQL script to load the data into the database."],
  ['next_steps', nil],
]

project_overview = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

project_overview_slide0 = Slide.create!(
  content: project_overview_content_0,
  parent: project_overview,
  slide_id: 0,
)

#################################################################################
##### Scrape Data Lesson ########################################################
#################################################################################

collect_data_content_0 = [
  ['text', "The first thing you must do is to collect the necessary financial data from Yahoo."],
  ['text', "You will scrape Yahoo finance historical data, which can be viewed here:"],
  ['link', "http://real-chart.finance.yahoo.com/table.csv?s=YHOO&d=7&e=1&f=2014&g=d&a=3&b=12&c=2000&ignore=.csv"],
  ['text-info', "Note that the text of the URL contains a series of parameters; scrape data from the years beginning in 1990."],
  ['text', "You're not given specific language requirement, but if you're unfamiliar with the work, we suggest Python."],
]

collect_data_content_1 = [
  ['text-info', "In order to scrape the relevant stock data, you must first get a list of stocks to scrape!"],
  ['text-success', "Get a list of NYSE symbols by searching on Google."],
  ['text', "You should be able to find a csv/excel table of all NYSE companies (and their stock symbols)."],
  ['text', "You should be able to find the list without having to register anywhere."],
  ['quiz', "finance_data_0"],
  ['text', "Good! Now you can use the list to iteratively scrape Yahoo Finance data."],
  ['text-info', "Write a script that will iteratively grab Yahoo Finance Data for each of the NYSE symbols you acquired."],
  ['text', "You're going to want to access the data by editing the sample link we gave (while altering some parameters)."],
]

collect_data_content_2 = [
  ['text', "Submit the code you used to collect the Yahoo data."],
  ['text', "If your code refers to an external file/csv, explain your comments what you expect the file to contain."],
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

collect_data_slide_2 = Slide.create!(
  content: collect_data_content_2,
  parent: collect_data_lesson,
  slide_id: 2,
)

quiz_intro_pd = ExactAnswerQuiz.create!(
  quiz_id: "finance_data_0",
  answer: "3000",
  project: project,
  slide: collect_data_slide_1,
  question: "How long is the list you found of NYSE stocks? Round to the nearest thousands:",
)

scraper_data_submission = SubmissionContext.create!(
  title: "Scraping Yahoo Finance",
  description: "User is asked to scrape Yahoo Finance.",
  slide: collect_data_slide_2,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

#################################################################################
##### SQL SCHEMA DESIGN/IMPLEMNT ################################################
#################################################################################

sql_overview_content = [
  ['text', "Now that you have the collected historical data, you must store the data into a SQL database."],
  ['text', "You first must explain your database design."],
  ['text', "Once you design the database, you will write implementation code that will import the csv into the database."],
  ['lesson_links', ""],
]

sql_lesson = Lesson.create!(
  title: "SQL Design/Implementation",
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
  ['text', "We want to design a SQL database that will hold all of our historical data."],
  ['text', "There are many different ways to store the data."],
  ['text', "However, you want to keep the schema as maintainable as possible."],
  ['text', "For example, you might want to add more comapny information later."],
  ['text-info', "Design a set of schemas that you're going to store which include the historical data points and symbols you scraped."],
  ['text', "For each table, include the column data type and a brief comment on what the column holds."],
  ['user_response', ""],
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
  ['text-info', "Now that you've designed your database, code up the schema."],
  ['text', "In addition to coding up the schema, also write a script that will load your scraped data into your schema."],
  ['user_code', ""],
  ['text-warning', "Make sure you've sufficiently commented in your code."],
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
  ['text-success', "You've completed the SQL finance challenge!"],
  ['text', "Now you have a set of financial data to which you can query and perform analysis on."],
  ['text', "In a future challenge, we'll re-visit the SQL database you created in order to do some in-depth analysis."],
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






