
main_page_content = [
  ['text','MightyHive is an advertising technology company that uses retargeting methods to send ads to users online. One product, “Call Center Remarketing”, uses call center log data to retarget those consumers online which did not make a purchase.'],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
  ['text', 'You will be submitting both code and written responses of your analysis and final recommendations.'],
]


project = Project.create!(
  title:"MightyHive: AdTech Split Testing",
  description: main_page_content,
  short_description: "A project sponsored by Mightyhive, an advertising technology company. You will perform data cleaning, de-duplication, and statistical analysis to determine the effectiveness of their marketing technology.",
  number: 12,
  enabled: false,
  has_content_submit: true,
  has_written_submit: true,
  uid: 12,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  company_overview: "",
  is_new: false,
  deadline: 2.weeks,
  cover_photo: "mightyhive",
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

data_matching_context = SubmissionContext.create!(
  title: "Data Matching Response",
  description: "Explain how you define a match between the Abandoned and Reservation data sets. There is no correct answer, use your best judgement and maximize the number of possible matches.",
  slide: data_matching_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

data_matching_context_two = SubmissionContext.create!(
  title: "Data Matching Code",
  description: "Submit code which performs the data matching under the assumptions you previously defined.",
  slide: data_matching_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_cleaning_content_one = [
	['text', 'After determining the total number of matched observations you should notice some data must be de-duplicated. Some customers make multiple reservations and should be distilled to one. Submit code which performs data de-duplication and cleaning so that you can perform analysis on the dataset.'],
	['text', 'First submit an explanation for your cleaning process. Then submit the code.'],
	['user_response', '#@TODO Include UID'],
]

data_cleaning_content_two = [
	['text', 'Paste your code below:'],
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
	slide_id: 1,
)

data_matching_context = SubmissionContext.create!(
  title: "Data Cleaning Response",
  description: "Submit an explanation for your cleaning process",
  slide: data_cleaning_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

data_matching_context_two = SubmissionContext.create!(
  title: "Data Cleaning Code",
  description: "Submit code which performs the cleaning.",
  slide: data_cleaning_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

stat_analysis_content_one = [
	['text', 'Define the null hypothesis and determine the appropriate statistical analysis.'],
	['user_response', '#@TODO Include UID'],
]

stat_analysis_content_two = [
	['text', 'Submit code which performs the statistical analysis including the calculation of the 95% confidence interval.'],
	['user_code', '#@TODO Include UID'],
]

stat_analysis_content_three = [
	['text', 'Submit a conclusion of the results. How effective was the MightyHive advertising product?'],
	['user_response', '#@TODO Include UID'],
	['next_steps', nil],
]

stat_analysis_step = Step.create!(
	title: "Statistical Analysis",
	lesson: challenge_lesson,
	step_id: 2,
)

stat_analysis_slide_one = Slide.create!(
	content: stat_analysis_content_one,
	parent: stat_analysis_step,
	slide_id: 0,
)
stat_analysis_slide_two = Slide.create!(
	content: stat_analysis_content_two,
	parent: stat_analysis_step,
	slide_id: 1,
)
stat_analysis_slide_three = Slide.create!(
	content: stat_analysis_content_three,
	parent: stat_analysis_step,
	slide_id: 2,
)
stat_analysis_context = SubmissionContext.create!(
  title: "Data Analysis Response",
  description: "Define the null hypothesis and determine the appropriate statistical analysis.",
  slide: stat_analysis_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
stat_analysis_context_two = SubmissionContext.create!(
  title: "Statistical Analysis Code",
  description: "Submit code which performs the statistical analysis including the calculation of the 95% confidence interval.",
  slide: stat_analysis_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)
stat_analysis_context_three = SubmissionContext.create!(
  title: "Statistical Analysis Response",
  description: "Submit a conclusion of the results. How effective was the MightyHive advertising product?",
  slide: stat_analysis_slide_three,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

return_code_one = [
 ['text', 'Submit all of the code you wrote to complete this data challenge below:'],
 ['user_code', '#@TODO Include UID'],
 ['next_steps', nil],
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

return_code_context = SubmissionContext.create!(
  title: "Entire Source Code",
  description: "Submit all of your code for this data challenge below:",
  slide: return_code_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::COMPLETE_CODE,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

presentation_one = [
 ['text', 'Submit a link to a google presentation (2-3 slides) of your analysis and conclusion. Make sure to edit the visibility options in the sharing settings to "Anyone with the link".'],
 ['user_response', ''],
]

presentation_two = [
 ['text', 'Submit a link to a youtube video of you presenting your conclusions (2 min max). Production quality is not important.'],
 ['user_response', ''],
 ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

presentation_lesson = Lesson.create!(
	title: "Presentation Submission",
	project: project,
	lesson_id: 3,
)

presentation_slide_one = Slide.create!(
	content: presentation_one,
	parent: presentation_lesson,
	slide_id: 0,
)

presentation_slide_two = Slide.create!(
	content: presentation_two,
	parent: presentation_lesson,
	slide_id: 1,
)

presentation_context = SubmissionContext.create!(
  title: "Presentation - slides",
  description: "Submit a 2-3 deck presentation of your analysis and conclusions.",
  slide: presentation_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::PRESENTATION_SLIDES_LINK,
)

return_code_context = SubmissionContext.create!(
  title: "Presentation - video",
  description: "Submit a video presenting your analysis and conclusion to the 'CEO'",
  slide: presentation_slide_two,
  submission_context_id: 1,
  submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK,
)
