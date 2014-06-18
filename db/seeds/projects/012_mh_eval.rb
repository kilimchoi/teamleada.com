
main_page_content = [
  ['text','MightyHive is an advertising technology company that uses retargeting methods to send ads to users online. One product, “Call Center Remarketing”, uses call center log data to retarget those consumers online which did not make a purchase.'],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
  ['text', 'You will be submitting both code and written responses of your analysis and final recommendations.'],
]


project = Project.create!(
  title:"MightyHive Eval",
  description: main_page_content,
  short_description: "A data project sponsored by Mightyhive, an advertising technology company. This data is based on a real problem that the analytics team at MightyHive encountered. You will perform data cleaning, de-duplication, and statistical analysis to determine the results of their marketing technology.",
  number: 12,
  enabled: true,
  uid: 12,
  difficulty: 'Assessment',
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################


project_overview_content = [
  ['text', 'This data challenge is based off of work that was directly done by the analytics team at MightyHive.'],
  ['text', 'We will first begin by describing the data you are provided and the context of the problem MightyHive was facing.'],
  ['text', 'You may complete this challenge in the following languages: R, Python, & MATLAB, but the preferred language is R.'],
  ['lesson_links', nil]
]


project_overview_lesson = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

project_overview_slide = Slide.create!(
  content: project_overview_content,
  parent: project_overview_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


data_content_one = [
	['text', 'The Abandoned Data Set:'],
	['link', 'https://s3.amazonaws.com/leada/mh_data/Abandoned_Data_Seed.csv'],
	['text', 'The Reservation Data Set:'],
	['link', 'https://s3.amazonaws.com/leada/mh_data/Reservation_Data_Seed.csv'],
	['text', 'There are two types of observations in the two data sets provided. Abandoned observations are the potential customers who called into the call center but did not make a purchase. Reservation observations are the customers who called into the call center and made a reservation.'],
]

data_content_two = [
	['text', 'The schema for both of the data sets is provided below:'],
	['text', 'Caller_ID - A unique ID given to each incoming phone call to the call center'],
	['text', 'Session - The Year/Month/Day/Time of each incoming phone call to the call center'],
	['text', 'Incoming_Phone - Phone number identified using caller indentification'],
	['text', 'Contact_Phone - Phone number the caller submits'],
	['next_steps', nil]
]

data_content_step = Step.create!(
  title: "Data Sets",
  lesson: project_overview_lesson,
  step_id: 0,
)

data_content_slide = Slide.create!(
  content: data_content_one,
  parent: data_content_step,
  slide_id: 0,
)

data_content_slide_two = Slide.create!(
  content: data_content_two,
  parent: data_content_step,
  slide_id: 1,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

experiment_content_one = [
	['text', 'The analytics team designed an experiment where the Abandoned observations were randomly split into test and control groups with an approximate 50-50 split.'],
	['text', 'The Abandoned observations in the test group were retargeted with advertisements online for a period of 7 days.'],
	['text', 'The control group was never show any advertisements.'],
	['text', 'The Reservation observations include observations from both the test and control groups.'],
	['next_steps', nil]
]

experiment_content_step = Step.create!(
	title: "Experiment Design",
	lesson: project_overview_lesson,
	step_id: 1,
)

experiment_slide = Slide.create!(
	content: experiment_content_one,
	parent: experiment_content_step,
	slide_id: 0,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

challenge_content_one = [
	['text', 'Your task is to analyze the data provided and return a conclusion of the effectiveness of the MightyHive Call Center Remarketing product. There are three sub-challenges to completing this project.'],
	['text', 'Data Matching:'],
	['text', 'You must determine how many of the observations in the Abandoned data set match with observations in the Reservation data set. Define what constitutes a match with your own assumptions and explain your thought process in your submission as well as the code which implements the matching.'],
	['text', 'Data Cleaning:'],
	['text', 'With a list of all of the matched Reservation observations some data de-duplication and cleaning must be performed. Some customers make multiple bookings for reservations and these must be distilled to a single reservation. There are also some observations which need to be removed.'],
]

challenge_content_two = [
	['text', 'Statistical Analysis:'],
	['text', 'Determine and conduct the appropriate statistical analysis. Define your null hypothesis and the 95% confidence interval for the change in proportion of Abandoned observations to Reservation observations between test and control groups.'],
	['lesson_links', nil]
]

challenge_lesson = Lesson.create!(
	title: "The Challenge",
	project: project,
	lesson_id: 1,
)

challenge_slide = Slide.create!(
	content: challenge_content_one,
	parent: challenge_lesson,
	slide_id: 0,
)

challenge_slide_two = Slide.create!(
	content: challenge_content_two,
	parent: challenge_lesson,
	slide_id: 1,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_matching_content_one = [
	['text', 'First explain how you define a match between the Abandoned and Reservation data sets. There is no correct answer, use your best judgement and maximize the number of possible matches.'],
	['user_response', '#@TODO Include UID'],
]

data_matching_content_two = [
	['text', 'Next submit code which performs the data matching under the assumptions you previously defined.'],
	['user_code', '#@TODO Include UID'],
	['next_steps', nil],
]

data_matching_step = Step.create!(
	title: "Data Matching",
	lesson: challenge_lesson,
	step_id: 0,
)

data_matching_slide = Slide.create!(
	content: data_matching_content_one,
	parent: data_matching_step,
	slide_id: 0,
)
data_matching_slide_two = Slide.create!(
	content: data_matching_content_two,
	parent: data_matching_step,
	slide_id: 1,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


data_cleaning_content_one = [
	['text', 'After determining the total number of matched observations you should notice some data must be de-duplicated. Some customers make multiple reservations and should be distilled to one. Submit code which performs data de-duplication and cleaning so that you can perform analysis on the dataset.'],
	['text', 'First submit an explanation for your cleaning process. Then submit the code.'],
	['user_response', '#@TODO Include UID'],
]

data_cleaning_content_two = [
	['user_code', '#@TODO Include UID'],
	['next_steps', nil],
]

data_cleaning_step = Step.create!(
	title: "Data Cleaning",
	lesson: challenge_lesson,
	step_id: 1,
)

data_cleaning_slide = Slide.create!(
	content: data_cleaning_content_one,
	parent: data_cleaning_step,
	slide_id: 0,
)

data_cleaning_slide_two = Slide.create!(
	content: data_cleaning_content_two,
	parent: data_cleaning_step,
	slide_id: 0,
)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


stat_analysis_content_one = [
	['text', 'Define the null hypothesis and determine the appropriate statistical analysis.'],
	['user_response', '#@TODO Include UID'],
	['text', 'Submit code which performs the statistical analysis including the calculation of the 95% confidence interval.'],
	['user_code', '#@TODO Include UID'],
	['text', 'Submit a conclusion of the results. How effective was the MightyHive advertising product?'],
	['user_response', '#@TODO Include UID'],
	['next_steps', nil],
]

stat_analysis_step = Step.create!(
	title: "Statistical Analysis",
	lesson: challenge_lesson,
	step_id: 2,
)

stat_analysis_slide = Slide.create!(
	content: stat_analysis_content_one,
	parent: stat_analysis_step,
	slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


return_code_one = [
	['text', 'Submit all of your code for this data challenge below:'],
	['user_code', '#@TODO Include UID'],
]

return_code_lesson = Lesson.create!(
	title: "Full Code Submission",
	project: project,
	lesson_id: 2,
)

return_code_slide = Slide.create!(
	content: return_code_one,
	parent: return_code_lesson,
	slide_id: 0,
)



