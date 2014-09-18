# @author:        Guang Yang
# @editor:        Tristan Tao
# @mktime:        2014/06/10
# @description:   web scraper project for boattrader.com in python

main_page_content = [
  ['text', 'In this project, you are tasked with building a web scraper for Statricks, an analytics technology company that aggregates price data on used goods.'],
  ['text', 'This project is designed to test your abilities to:'],
  ['text', '1. Build an effective and efficient data collection script in python'],
  ['text', '2. Navigate through terse html files'],
  ['text', '3. Utilize existing packages in python to your advantage'],
]

project = Project.create!(
  title: "Statricks: Data Collection with Python",
  description: main_page_content,
  short_description: "A project sponsored by Statricks, an e-Commerce analytics company. In this data challenge you will build a web scraper using the Beautiful Soup library to extract listing information. This data challenge is for users with experience in Python and some HTML.",
  number: 13,
  enabled: false,
  has_leaderboard: false,
  has_written_submit: true,
  uid: 13,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  company_overview: "",
  is_new: false,
  deadline: 2.weeks,
  featured: false,
  cover_photo: "statricks",
)

puts "============ Created project: #{project.title}."

############################################
########## -- PROJECT OVERVIEW -- ##########
############################################

project_overview_content0 = [
  ['text', 'In this project, you are tasked with building a web scraper for Statricks, an analytics technology company that aggregates price data on used goods.'],
  ['text', 'This project is designed to test you abilities to:'],
  ['text', '1. Building an effective and efficient data collection script in python'],
  ['text', '2. Navigate through terse html files'],
  ['text', '3. Utilize existing packages in python to your advantage'],
  ['lesson_links', nil],
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

########## -- PROJECT OVERVIEW: Background -- ##########

project_overview_background_content0 = [
  ['text', 'Statricks is an analytics technology company specializing in pricing used goods.'],
  ['text', 'By aggregating price data from different sources, Statricks provides price trends for users to find good deals when buying, and maximize returns when selling used goods'],
  ['text', 'In order for price trends to be accurate, Statricks needs data from various sources (eBay, craigslist, and CarMax) – while some of these sources have Application Programming Interfaces (APIs) in place that enable easy data acquisition, a majority of them do not.'],
  ['text', 'As a result, we need to “scrape” these websites to get the pricing data we want.'],
  ['next_steps', nil],
]

project_overview_background = Step.create!(
  title: "Background",
  lesson: project_overview,
  step_id: 0,
)

project_overview_background_slide0 = Slide.create!(
  content: project_overview_background_content0,
  parent: project_overview_background,
  slide_id: 0,
)

########## -- PROJECT OVERVIEW: Our Goal -- ##########

project_overview_our_goal_content0 = [
  ['text', 'You are tasked with making a web scraper in python for the following website:'],
  ['link', "http://www.boattrader.com"],
  ['text', 'It\'s a website that specializes in used boats.'],
  ['text', 'Speifically, we need an automated way of doing two things:'],
  ['text', '1. Find the URL for each and every boat being listed on the entire website'],
  ['text', '2. For each boat, find and store the unique boat information (title, contact number, price etc)'],
  ['next_steps', nil],
]


project_overview_our_goal = Step.create!(
  title: "Our Goal",
  lesson: project_overview,
  step_id: 1,
)

project_overview_our_goal_slide0 = Slide.create!(
  content: project_overview_our_goal_content0,
  parent: project_overview_our_goal,
  slide_id: 0,
)

########## -- PROJECT OVERVIEW: Resources -- ##########

project_overview_resources_content0 = [
  ['text', 'For both tasks, you might find these two popular python packages very helpful:'],
  ['text', '1. BeautifulSoup'],
  ['text', '2. Requests'],
  ['next_steps', nil],
]


project_overview_resources = Step.create!(
  title: "Resources",
  lesson: project_overview,
  step_id: 2,
)

project_overview_resources_slide0 = Slide.create!(
  content: project_overview_resources_content0,
  parent: project_overview_resources,
  slide_id: 0,
)

##############################################
########## -- Building a Crawler -- ##########
##############################################

crawler_content0 = [
  ['text', 'Before we begin to extract details from a boat listing, we need to first find the URL of that particular webpage and read the content of the html file.'],
  ['text', 'Since we are interested in ALL of the listtings, we need to make a class of functions that will help us do this.'],
  ['text', 'Make sure to name your functions as specified in the left navigation bar.'],
  ['lesson_links', nil],
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
  ['text', 'Let us start by creating a function that when given a raw URL link, queries and returns the raw html file as String.'],
  ['user_code', ''],
  ['next_steps', nil],
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

crawler_getRaw_context0 = SubmissionContext.create!(
  title: "Raw HTML.",
  description: "User is asked to create a function that queries and returns the raw html when given a raw URL link.",
  slide: crawler_getRaw_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- BUILDING A CRAWLER: get_listing_urls -- ##########

crawler_getListing_content0 = [
  ['text', 'Next, given a raw html of a single search result page, we want to extract the list of URL links to actual listings.'],
  ['user_code', ''],
  ['next_steps', nil],
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

crawler_getListing_context0 = SubmissionContext.create!(
  title: "List of URLs.",
  description: "User is asked to create a function that extracts the list of URL links to actual listings when given a raw html of a single search result page.",
  slide: crawler_getListing_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- BUILDING A CRAWLER: generate_search_links -- ##########

crawler_scrape_search_content0 = [
  ['text', 'Lastly, we want to generate search result links.'],
  ['text', 'Do a sample boat search to see what the url looks like.'],
  ['text', 'What do you notice? Perhaps the URL seems structured?'],
  ['text', 'Well, that\'s because the URL is a REST endpoint.'],
  ['text', 'Do you see a way to generate the search result links? Try a few different searches (and visit multiple result pages). Explain below:'],
  ['user_response', 'User Response here!'],
  ['text', 'Don\' forget to think about how you would want to parameterize the function.'],
]

crawler_scrape_search_content1 = [
  ['text', 'Now write the code that generates a series of search result pages\' url.'],
  ['user_code', 'User Code here'],
  ['next_steps', nil],
]

crawler_scrape_search = Step.create!(
  title: "generate_search_url",
  lesson: crawler,
  step_id: 2,
)

crawler_scrape_search_slide0 = Slide.create!(
  content: crawler_scrape_search_content0,
  parent: crawler_scrape_search,
  slide_id: 0,
)

crawler_scrape_search_slide1 = Slide.create!(
  content: crawler_scrape_search_content1,
  parent: crawler_scrape_search,
  slide_id: 1,
)

crawler_scrape_search_context0 = SubmissionContext.create!(
  title: "Generate Search Links - Response",
  description: "User is asked explain how he/she plans to generate search result page url, given that it is REST.",
  slide: crawler_scrape_search_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

crawler_scrape_search_context1 = SubmissionContext.create!(
  title: "Generate Search Links - Code",
  description: "User is asked write code that generates a formatted REST urls that represent search page results.",
  slide: crawler_scrape_search_slide1,
  submission_context_id: 1,
  submission_type: SubmissionContext::CODE,
)

######################################################
########## -- Extracting Listing Details -- ##########
######################################################
extract_content0 = [
  ['text', 'To extract information from a boat listing, we need to find the URL of that particular webpage.'],
  ['text', 'We already built the modules to help us achieve that!'],
  ['text', 'We first use the "generate_search_url" with some parameter to load a search result url.'],
  ['text', 'Then you can use the "get_listing_urls" function to get individual url.'],
  ['text', 'Once you have the raw html to a single listing page, the following functions will come in handy.'],
  ['lesson_links', nil],
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
  ['text', 'Given a URL, write a function that returns the unique identifier (UID) of the listing.'],
  ['text', 'HINT: perhaps the "get_raw_html()" will be useful!'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_uid_context0 = SubmissionContext.create!(
  title: "Extract Unique ID.",
  description: "User is asked to write a function that returns the unique identifier (UID) of the listing given a listing URL.",
  slide: extract_uid_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_title -- ##########

extract_title_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the title of an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_title_context0 = SubmissionContext.create!(
  title: "Extract Title.",
  description: "User is asked to write a function that returns the title of the listing given a beautifulsoup object.",
  slide: extract_title_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_price -- ##########

extract_price_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the price of an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_price_context0 = SubmissionContext.create!(
  title: "Extract Price.",
  description: "The user is asked to write a function that returns the price of the listing given a beautifulsoup object.",
  slide: extract_price_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_description -- ##########

extract_description_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the description of an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_description_context0 = SubmissionContext.create!(
  title: "Extract Description.",
  description: "User is asked to write a function that returns the description of a listing given a beautifulsoup object.",
  slide: extract_description_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_img_URL -- ##########

extract_img_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns a list of image URLs of an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_img_context0 = SubmissionContext.create!(
  title: "Extract Image URL.",
  description: "User is asked to write a function that returns the image URL of a listing given a beautifulsoup object.",
  slide: extract_img_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_phone_num -- ##########

extract_phone_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the phone number in an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_phone_context0 = SubmissionContext.create!(
  title: "Extract Phone Number.",
  description: "User is asked to write a function that returns the phone number of a listing given a beautifulsoup object.",
  slide: extract_phone_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########## -- EXTRACTING LISTING DETAILS: get_details -- ##########

extract_details_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the "details section" of an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
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

extract_details_context0 = SubmissionContext.create!(
  title: "Extract Details.",
  description: "User is asked to write a function that returns the \"details section\" of a listing given a beautifulsoup object.",
  slide: extract_details_slide0,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

########################################
########## -- All Together -- ##########
########################################

all_together_content_zero = [
  ['text', 'Now to put everything together.'],
  ['text', 'Consider the following:'],
  ['text', '1. You have the code that generates the search results.'],
  ['text', '2. You have the code that grabs the URL of the invidual listing page from search results.'],
  ['text', '3. You have the functions that extract various information from the listing page.'],
  ['text', 'Now you have to put it together!'],
  ['lesson_links', nil],
]

all_together_lesson = Lesson.create!(
  title: "The Complete Scraper",
  project: project,
  lesson_id: 3,
)

all_together_slide0 = Slide.create!(
  content: all_together_content_zero,
  parent: all_together_lesson,
  slide_id: 0,
)

########## -- ALL TOGETHER: A Functioning Algorithm -- ##########

all_together_put_together_content_0 = [
  ['text', 'Put the module together into a single file.'],
  ['text', 'You can organize the code however you deem fit.'],
  ['text', 'For now, you can have the code print the information extracted. We\'ll get to outputting/storing data last.'],
  ['text', 'Make sure you comment on how to run it.'],
  ['text', 'Also be prepared to explain why you organized it the way you did.'],
  ['text', 'Paste the entire codebase below. Don\'t forget to comment on how to run the code!'],
  ['user_code', ''],
]

all_together_put_together_content_1 = [
  ['text', 'How did you organize the code?'],
  ['text', 'What were some of the issues you considered?'],
  ['text', 'Why did you organize it that way?'],
  ['text', 'Explain any relevant thoughts below:'],
  ['user_response', ''],
  ['next_steps', nil],
]

combining_module_step = Step.create!(
  title: "Combining the Modules",
  lesson: all_together_lesson,
  step_id: 0,
)

all_together_put_slides_0 = Slide.create!(
  content:all_together_put_together_content_0,
  parent: combining_module_step,
  slide_id: 0,
)

all_together_put_slides_1 = Slide.create!(
  content:all_together_put_together_content_1,
  parent: combining_module_step,
  slide_id: 1,
)

all_together_put_code_context = SubmissionContext.create!(
  title: "Complete Module - code",
  description: "User is asked to put together the entire modules, effectively creating a working scarper.",
  slide: all_together_put_slides_0,
  submission_context_id: 0,
  submission_type: SubmissionContext::COMPLETE_CODE,
)

all_together_put_response_context = SubmissionContext.create!(
  title: "Complete Module - response",
  description: "User is asked to explain process/how/why they organized the scraper code.",
  slide: all_together_put_slides_1,
  submission_context_id: 1,
  submission_type: SubmissionContext::RESPONSE,
)

########################################
#### -- Concluding Section -- ##########
########################################

presentation_one = [
  ['text', 'Now that you have a working scraper, you\'ll have to present your process!'],
  ['text', 'We\'re going to ask you to create (and present) a 3 slide presentation.'],
  ['text', 'On the first 2 slides, explain what you did with the scraper.'],
  ['text', 'On the last (3rd) slide, explain how you would store the scraped data.'],
  ['text', 'The last slide is about design. You won\'t be asked to code up your plan, but be ready to explain it.'],
]

presentation_two = [
 ['text', 'Submit a link to a google presentation (3 slides) of your analysis and conclusion.'],
 ['user_response', ''],
]

presentation_three = [
 ['text', 'Submit a link to a video of you presenting your conclusions (2 min max). Production quality is not important.'],
 ['user_response', ''],
 ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

presentation_lesson = Lesson.create!(
  title: "Final Presentation - Statricks",
  project: project,
  lesson_id: 4,
)

all_together_slide_one = Slide.create!(
  content: presentation_one,
  parent: presentation_lesson,
  slide_id: 0,
)

presentation_slide_two= Slide.create!(
  content: presentation_two,
  parent: presentation_lesson,
  slide_id: 1,
)

presentation_slide_three = Slide.create!(
  content: presentation_three,
  parent: presentation_lesson,
  slide_id: 2,
)
presentation_context = SubmissionContext.create!(
  title: "Presentation - Slides",
  description: "User is asked create a 3 slides presentation for the statricks project.",
  slide: presentation_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::PRESENTATION_SLIDES_LINK,
)

return_code_context = SubmissionContext.create!(
  title: "Presentation - Video",
  description: "User is asked to create a video presentation (no longer than 2 min) of the statricks slides.",
  slide: presentation_slide_three,
  submission_context_id: 1,
  submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK,
)
