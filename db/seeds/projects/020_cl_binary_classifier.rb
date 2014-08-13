main_page_content = [
  ['text', "In this challenge, you'll be building a binary classifier for craigslist ads."],
  ['text', "If you're not familiar with craigslist, check out their website:"],
  ['link', "http://www.craigslist.org/about/sites"],
  ['text', "When you post an ad on Craigslist, you have the option to list a single item or multiple items"],
  ['text', "Your job is to create a model that predicts (classifies) whether an ad contains a single item or multiple items"],
  ['text-success', "Let's get started!"],
]

project = Project.create!(
  title: "Craigslist Ads: Binary Classifier",
  description: main_page_content,
  short_description: "In this lesson, we'll give a brief introduction to Python's Pandas module. You'll need to have Ipython Notebook to properly do all the exercises.",
  number: 20,
  enabled: true,
  has_leaderboard: true,
  has_submit: true,
  category: Project::CHALLENGE,
  uid: 20,
  difficulty: 'Advanced',
  is_new: true,
  deadline: 2.weeks,
)

puts "============ Created project: #{project.title}."


#############################################
########### -- PROJECT OVERVIEW -- ##########
#############################################

project_overview_content_0 = [
  ['text-success', "You work as a Data Scientist at a small team online eCommerce company."],
  ['text', "In order to gather more product intelligence, you're tasked with grabbing average product prices from other eCommerce hubs."],
  ['lesson_links', ""],
]

overview_lesson = Lesson.create!(
  title: "Problem context",
  lesson_id: 0,
  project: project,
)

overview_slide_one = Slide.create!(
  content: project_overview_content_0,
  slide_id: 0,
  parent: overview_lesson
)

#############################################
background_context_content_one = [
  ['text', "You decide look through Craigslist to see what the ads look like."],
  ['text', "You then notice a problem:"],
  ['text-danger', "Some ads have a single item (just as you expected), but you also notice ads with multiple listings."],
  ['text', "This is problematic, because your existing price extractor will yield incorrect prices."],
  ['text', "Moreover, this means you might have to design a new price extractor that will work on multiple prices."],
  ['text', "But this means you'll need a large set of multiple price ad data."],
  ['text', "To tackle the issue, you decide to create a classifier to help you classify ads as Single or Multiple."],
  ['text', "With the classifier, you'll be able to grab a large dataset of multiple item ads."],
  ['text', "Moreoever, you can use the classifier to decide which price extractor to use."],
  ['text', "Satisfied with the decision, you begin your process."],
  ['next_steps', ''],
]

background_context_step = Step.create!(
  title: "Context",
  step_id: 0,
  lesson: overview_lesson,
)

background_context_slide_one = Slide.create!(
  content: background_context_content_one,
  slide_id: 0,
  parent: background_context_step
)

#############################################
data_context_content_one = [
  ['text-info', "In order to get the necessary data, you start with a simple crawler."],
  ['text', "You use your webscraping skills to whip up a crawler, and you run it on Craigslist with the search term:"],
  ['text-success', "Motorcycles"],
  ['text', "You realize that you hit a limit at 2500 for each specific region for a specific keyword."],
  ['text', "There is no point in trying to bypass the limit right now."],
  ['text', "You simply scrape some other regions to scrape."],
  ['text', "The resulting data is below."],
  ['fail-link', "some aws linl"],
]

data_context_content_two = [
  ['text', "Once you've scraped the data, you think about how to lable them"],
  ['text', "Could this be a task left for an intern?"],
  ['quiz', "cl_data_context_0"],
  ['text', "Could this possibly hurt the intern's view of you as a mentor?"],
  ['quiz', "cl_data_context_1"],
  ['text-success', "You decide against using the intern."],
  ['text', "Instead, you utilize an Amazon Mechanical Turk campaign"],
]
data_context_content_three = [
  ['text', "The resulting data:"],
  ['fail-link', "some link"],
  ['text', "When you unzip the file, you'll get the following folders and files:"],
  ['text-warning', "    ~/train/*"],
  ['text', "  * Each of these files represent a single scraped ad, used for training. Comes with training labels."],
  ['text-warning', "    ~/train-mapping"],
  ['text', "  * This is a mapping of ad_filename_id to whether the ad was single or multiple"],
  ['text-warning', "    ~/test/*"],
  ['text', "  * Each of these files represent a single scraped ad. You'll use this to make a submission."],
  ['next_steps', ""],
]


cl_data_context_quiz = Quiz.create!(
  quiz_id: "cl_data_context_0",
  answer: "no",
)

cl_data_context_quiz = Quiz.create!(
  quiz_id: "cl_data_context_1",
  answer: "yes",
)
data_context_step = Step.create!(
  title: "Getting the Data",
  step_id: 1,
  lesson: overview_lesson,
)

data_context_slide_one = Slide.create!(
  content: data_context_content_one,
  slide_id: 0,
  parent: data_context_step,
)

data_context_slide_two = Slide.create!(
  content: data_context_content_two,
  slide_id: 1,
  parent: data_context_step,
)

data_context_slide_three = Slide.create!(
  content: data_context_content_three,
  slide_id: 2,
  parent: data_context_step,
)
