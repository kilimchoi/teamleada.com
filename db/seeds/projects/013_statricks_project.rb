# @author:        Guang Yang
# @mktime:        2014/06/10
# @description:   web scraper project for boattrader.com in python

main_page_content = [
  ['text', 'In this project, we wish to build a web scraper for Statricks, an analytics technology company that aggregates price data on used good'],
  ['text', 'This project is designed to test you abilities to:'],
  ['text', '1. build efficient and elegant algorithms in python'],
  ['text', '2. navigate through terse html files'],
  ['text', '3. utilize existing packages in python'],
]

project = Project.create!(
  title: "Statricks: Data Collection with Python",
  description: main_page_content,
  short_description: "A data project created by Statricks, an analytics technology company. In this project you will build a web scraper to extract listing information. This project is for users with experience in Python and some HTML.",
  number: 13,
  enabled: true,
  has_leaderboard: false,
  has_submit: false,
  uid: 13,
  difficulty: 'Advanced',
)

puts "============ Created project: #{project.title}."


############################################
########## -- PROJECT OVERVIEW -- ##########
############################################

projectOverview_content0 = [
  ['text', 'In this project, we wish to build a web scraper for Statricks, an analytics technology company that aggregates price data on used good'],
  ['text', 'This project is designed to test you abilities to:'],
  ['text', '1. build efficient and elegant algorithms in python'],
  ['text', '2. navigate through terse html files'],
  ['text', '3. utilize existing packages in python'],
]

projectOverview = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

projectOverview_slide0 = Slide.create!(
  content: projectOverview_content0,
  parent: projectOverview,
  slide_id: 0,
)

########## -- PROJECT OVERVIEW: Background -- ##########

projectOverview_background_content0 = [
  ['text', 'Statricks is an analytics technology company specializing in pricing used goods.'],
  ['text', 'By aggregating price data from different sources, Statricks provides price trends for users to find good deals when buying and maximize returns when selling in the used goods market.'],
  ['text', 'In order for price trends to be accurate, Statricks needs to get data from varied sources (think eBay, craigslist, and CarMax) – while some of these sources have Application Programming Interface (API) in place (e.g. eBay) that allows easy access for data acquisition, a majority of them do not.'],
  ['text', 'As a result, we need to “scrape” these websites to get the pricing data we want.'],
]


projectOverview_background = Step.create!(
  title: "Background",
  lesson: projectOverview,
  step_id: 0,
)

projectOverview_background_slide0 = Slide.create!(
  content: projectOverview_background_content0,
  parent: projectOverview_background,
  slide_id: 0,
)

########## -- PROJECT OVERVIEW: Our Goal -- ##########

projectOverview_ourGoal_content0 = [
  ['text', 'We’re tasked with making a web scraper in python for www.boattrader.com, a website that specializes in used boats, to retrieve the information we need. '],
  ['text', 'Specifically, we need an automated way of doing two things:'],
  ['text', '1. find the URL for each and every boat being listed on the entire website'],
  ['text', '2. for each boat, find and store the unique boat information (title, contact number, price etc)'],
]


projectOverview_ourGoal = Step.create!(
  title: "Our Goal",
  lesson: projectOverview,
  step_id: 1,
)

projectOverview_ourGoal_slide0 = Slide.create!(
  content: projectOverview_ourGoal_content0,
  parent: projectOverview_ourGoal,
  slide_id: 0,
)

########## -- PROJECT OVERVIEW: Resources -- ##########

projectOverview_resources_content0 = [
  ['text', 'For both tasks, you might find these two popular python packages very helpful:'],
  ['text', '1. BeautifulSoup'],
  ['text', '2. Requests'],
]


projectOverview_resources = Step.create!(
  title: "Resources",
  lesson: projectOverview,
  step_id: 2,
)

projectOverview_resources_slide0 = Slide.create!(
  content: projectOverview_resources_content0,
  parent: projectOverview_resources,
  slide_id: 0,
)

##############################################
########## -- Building a Crawler -- ##########
##############################################

crawler_content0 = [
  ['text', 'Before we begin to extract details from a boat listing, we need to first find the URL of that particular
        webpage and read the content of the html file. Since we are interested in ALL of the listtings, we need 
        to make a class of functions that will help us do this'],
]


crawler = Lesson.create!(
  title: "Building a Crawler",
  project: project,
  lesson_id: 1,
)

crawler_slide0 = Slide.create!(
  content: crawler_content0,
  parent: crawler,
  slide_id: 0,
)


########## -- BUILDING A CRAWLER: get_raw_html -- ##########

crawler_getRaw_content0 = [
  ['text', 'Let us start by creating a function that when given a raw URL link, queries and returns the raw html file'],
  ['user_code', ''],
]


crawler_getRaw = Step.create!(
  title: "get_raw_html",
  lesson: crawler,
  step_id: 0,
)

crawler_getRaw_slide0 = Slide.create!(
  content: crawler_getRaw_content0,
  parent: crawler_getRaw,
  slide_id: 0,
)


########## -- BUILDING A CRAWLER: get_listing_urls -- ##########

crawler_getListing_content0 = [
  ['text', 'Next, given a raw html of a single search result page, we want to extract the list of URL links to actual listings.'],
  ['user_code', ''],
]


crawler_getListing = Step.create!(
  title: "get_listing_urls",
  lesson: crawler,
  step_id: 1,
)

crawler_getListing_slide0 = Slide.create!(
  content: crawler_getListing_content0,
  parent: crawler_getListing,
  slide_id: 0,
)

########## -- BUILDING A CRAWLER: scrape_search_results -- ##########

crawler_scrapeSearch_content0 = [
  ['text', 'Lastly, with a given link for search results, we want a list of links to individual listings'],
  ['user_code', ''],
]


crawler_scrapeSearch = Step.create!(
  title: "scrape_search_results",
  lesson: crawler,
  step_id: 2,
)

crawler_scrapeSearch_slide0 = Slide.create!(
  content: crawler_scrapeSearch_content0,
  parent: crawler_scrapeSearch,
  slide_id: 0,
)

######################################################
########## -- Extracting Listing Details -- ##########
######################################################
extract_content0 = [
  ['text', 'Before we begin to extract details from a boat listing, we need to first find the URL of that particular webpage and read the content of the html file. Since we are interested in ALL of the listtings, we need to make a class of functions that will help us do this'],
]


extract = Lesson.create!(
  title: "Extracting Listing Details",
  project: project,
  lesson_id: 2,
)

extract_slide0 = Slide.create!(
  content: extract_content0,
  parent: extract,
  slide_id: 0,
)


########## -- EXTRACTING LISTING DETAILS: get_UID -- ##########

extract_uid_content0 = [
  ['text', 'Given URL, write a function that returns the unique identifier (UID) of the listing'],
  ['user_code', ''],
]


extract_uid = Step.create!(
  title: "get_UID",
  lesson: extract,
  step_id: 3,
)

extract_uid_slide0 = Slide.create!(
  content: extract_uid_content0,
  parent: extract_uid,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_title -- ##########

extract_title_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the title of an individual listing page'],
  ['user_code', ''],
]


extract_title = Step.create!(
  title: "get_title",
  lesson: extract,
  step_id: 4,
)

extract_title_slide0 = Slide.create!(
  content: extract_title_content0,
  parent: extract_title,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_price -- ##########

extract_price_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the price of an individual listing page'],
  ['user_code', ''],
]


extract_price = Step.create!(
  title: "get_price",
  lesson: extract,
  step_id: 5,
)

extract_price_slide0 = Slide.create!(
  content: extract_price_content0,
  parent: extract_price,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_description -- ##########

extract_description_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the description of an individual listing page'],
  ['user_code', ''],
]


extract_description = Step.create!(
  title: "get_description",
  lesson: extract,
  step_id: 6,
)

extract_description_slide0 = Slide.create!(
  content: extract_description_content0,
  parent: extract_description,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_img_URL -- ##########

extract_img_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the image URL of an individual listing page'],
  ['user_code', ''],
]


extract_img = Step.create!(
  title: "get_img_URL",
  lesson: extract,
  step_id: 7,
)

extract_img_slide0 = Slide.create!(
  content: extract_img_content0,
  parent: extract_img,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_phone_num -- ##########

extract_phone_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the phone number of an individual listing page'],
  ['user_code', ''],
]


extract_phone = Step.create!(
  title: 'get_phone_num',
  lesson: extract,
  step_id: 8,
)

extract_phone_slide0 = Slide.create!(
  content: extract_phone_content0,
  parent: extract_phone,
  slide_id: 0,
)

########## -- EXTRACTING LISTING DETAILS: get_details -- ##########

extract_details_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the details section of an individual listing page'],
  ['user_code', ''],
]


extract_details = Step.create!(
  title: "get_details",
  lesson: extract,
  step_id: 9,
)

extract_details_slide0 = Slide.create!(
  content: extract_details_content0,
  parent: extract_details,
  slide_id: 0,
)



########################################
########## -- All Together -- ##########
########################################

allTogether_content0 = [
  ['text', 'We are almost there!'],
]


allTogether = Lesson.create!(
  title: "All Together",
  project: project,
  lesson_id: 3,
)

allTogether_slide0 = Slide.create!(
  content: allTogether_content0,
  parent: allTogether,
  slide_id: 0,
)

########## -- ALL TOGETHER: Saving the Output -- ##########

allTogether_save_content0 = [
  ['text', 'Lastly we want a way of storing the output into a .csv file'],
  ['user_code', ''],
]


allTogether_save = Step.create!(
  title: "Saving the Output",
  lesson: allTogether,
  step_id: 0,
)

allTogether_save_slide0 = Slide.create!(
  content: allTogether_save_content0,
  parent: allTogether_save,
  slide_id: 0,
)

########## -- ALL TOGETHER: A Functioning Algorithm -- ##########

allTogether_algo_content0 = [
  ['text', 'Put the finishing touches, tidy up the documentations and submit all your codes here:'],
  ['user_code', ''],
]


allTogether_algo = Step.create!(
  title: "A Functioning Algorithm",
  lesson: allTogether,
  step_id: 1,
)

allTogether_algo_slide0 = Slide.create!(
  content: allTogether_algo_content0,
  parent: allTogether_algo,
  slide_id: 0,
)