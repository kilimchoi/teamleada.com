# @author:        Guang Yang
# @editor:        Tristan Tao
# @mktime:        2014/06/10
# @description:   web scraper project for boattrader.com in python

main_page_content = [
  ['text-info', "The overall goal of this project series is to create a functional webscraper."],
  ['text-warning', "In Part. 1, we'll focus on getting the raw html + walking the search result pages."],
  ['text', "This will involve taking advantage of some REST endpoint, in addition to walking through raw search result html to collect relevant urls."],
  ['text', "We'll focus on extracting individual advertisement level data in the next part."],
  ['text-success', "Let's get started"],
]

project = Project.create!(
  title: "Statricks: Web Scraping with Python (Part 1): Search Result Parsing",
  description: main_page_content,
  short_description: "A project sponsored by Statricks, an e-Commerce analytics company. In this data challenge you will build a web scraper using the Beautiful Soup library to extract listing information. This data challenge is for users with experience in Python and some HTML.",
  number: 26,
  enabled: true,
  has_leaderboard: false,
  has_written_submit: true,
  uid: 26,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  company_overview: "",
  is_new: false,
  deadline: 4.hours,
  featured: false,
  cover_photo: "statricks",
)

puts "============ Created project: #{project.title}."

############################################
########## -- PROJECT OVERVIEW -- ##########
############################################

project_overview_content0 = [
  ['text-info', "At companies like Statricks, ad data is valuable for market intelligence."],
  ['text', "They scrape various websites to figure out the selling price of an individual item."],
  ['text', "Once you've acquired enough item-level data, you can engage in building analytical models."],
  ['text', "To get to creating interesting data models, it all starts here:"],
  ['text-success', "Data Acquisistion"],
]

project_overview_content1 = [
  ['text', "Specifically for our purpose, we'll be scraping a website called:"],
  ['link', "http://www.boattrader.com   "],
  ['text-info', "In order to scrape the website, you have to come up with a way to walk the url links."],
  ['text', "There are different ways to find the urls to walk."],
  ['text', "The way we suggest is to run a generic search and parse the search result page url."],
  ['text-success', "As you permutate the result page url, you'll be able to simulate browsing through the search results."],
  ['next_steps', ""],
]

project_overview = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 1,
)

project_overview_slide0 = Slide.create!(
  content: project_overview_content0,
  parent: project_overview,
  slide_id: 0,
)
project_overview_slide1 = Slide.create!(
  content: project_overview_content1,
  parent: project_overview,
  slide_id: 1,
)

##############################################
########## -- Building a Crawler -- ##########
##############################################

crawler_content0 = [
  ['text', "Write a function that returns a list of urls to individuals listing."],
  ['text', "Though we suggested that you walk the search result url, you don't have to follow the exact direction."],
  ['text', "A sample ad url would look like the following:"],
  ['code', "http://www.boattrader.com/listing/2009-Supra-Launch-24-SSV-102286745"],
  ['text', "Paste in the relevant code below:"],
  ['text', "Make sure to include all relevant function you used, plus any imports you might have done."],
  ['next_steps', nil],
]


crawler = Lesson.create!(
  title: "Search Result Page",
  project: project,
  lesson_id: 2,
)

crawler_slide0 = Slide.create!(
  content: crawler_content0,
  parent: crawler,
  slide_id: 0,
)

crawler_getRaw_context0 = SubmissionContext.create!(
  title: "Get Ad URLs",
  description: "User is asked to return the code that will return a list of url to invidual ads (after search result url walks).",
  slide: crawler_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########################################
#### -- Concluding Section -- ##########
########################################

response_one = [
  ['text', "Explain what you did to get a list of advertisement urls"],
  ['user_respose', ""],
  ['next_steps', ""],
]

response_lesson = Lesson.create!(
  title: "Final response - Statricks",
  project: project,
  lesson_id: 3,
)

response_slide_one = Slide.create!(
  content: response_one,
  parent: response_lesson,
  slide_id: 0,
)

get_ad_response = SubmissionContext.create!(
  title: "Explaining Ad URL acquisition",
  description: "User is asked to explain how he/she got the list of ads.",
  slide: response_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::PRES_SLIDES_LINK,
)

