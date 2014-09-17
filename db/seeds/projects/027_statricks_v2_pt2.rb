# @author:        Guang Yang
# @editor:        Tristan Tao
# @mktime:        2014/06/10
# @description:   web scraper project for boattrader.com in python

main_page_content = [
  ['text', "Welcome to Part 2!"],
  ['text', "In Part 1, we created a way to come up with a list of individual listing URLs."],
  ['text', "Now we'll work on extracting info from those individual listings."],
]

project = Project.create!(
  title: "Statricks: Web Scraping with Python (Part 2): Product Data Extraction",
  description: main_page_content,
  short_description: "Part 2 of a project sponsored by Statricks, an e-Commerce analytics company. In this sequel, we'll be focusing on getting the actual info from the individual listings.",
  number: 27,
  enabled: true,
  has_leaderboard: false,
  has_written_submit: true,
  uid: 27,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  company_overview: "",
  is_new: true,
  deadline: 2.weeks,
  featured: false,
  cover_photo: "statricks",
)

puts "============ Created project: #{project.title}."

############################################
########## -- PROJECT OVERVIEW -- ##########
############################################

project_overview_content0 = [
  ['text', "Since you have access to the individual listing URLs from Part 1, you essentially have access to the raw html of an individual listing."],
  ['text-warning', "We'll go through a list data points that we'll need to grab from each listing:"],
  ['text', " - UID"],
  ['text', " - Listing Title"],
  ['text', " - Price"],
  ['text', " - Description"],
  ['text', " - Phone Number"],
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

########## -- EXTRACTING LISTING DETAILS: get_UID -- ##########

extract_uid_content0 = [
  ['text', 'Given a URL, write a function that returns the unique identifier (UID) of the listing.'],
  ['text', 'HINT: perhaps the "get_raw_html()" will be useful!'],
  ['user_code', ''],
  ['next_steps', nil],
]


extract_uid = Step.create!(
  title: "get_UID",
  lesson: project_overview,
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
  lesson: project_overview,
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
  lesson: project_overview,
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

########## -- EXTRACTING LISTING DETAILS: get_phone_num -- ##########

extract_phone_content0 = [
  ['text', 'Given a beautifulsoup object, write a function that returns the phone number in an individual listing page.'],
  ['user_code', ''],
  ['next_steps', nil],
]

extract_phone = Step.create!(
  title: 'get_phone_num',
  lesson: project_overview,
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
  title: "Presentation - slides",
  description: "User is asked create a 3 slides presentation for the statricks project.",
  slide: presentation_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::PRES_SLIDES_LINK,
)

return_code_context = SubmissionContext.create!(
  title: "Presentation - video",
  description: "User is asked to create a video presentation (no longer than 2 min) of the statricks slides.",
  slide: presentation_slide_three,
  submission_context_id: 1,
  submission_type: SubmissionContext::PRES_VIDEO_LINK,
)
