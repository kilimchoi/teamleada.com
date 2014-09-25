main_page_content = [
  ['text-info', "MightyHive is an advertising technology company that uses retargeting methods to send ads to users online."],
  ['text', "One product, “Call Center Remarketing”, uses call center log data to retarget those consumers online which did not make a purchase."],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
  ['text-success', 'You will be submitting both code and written responses of your analysis and final recommendations.'],
]

project = Project.create!(
  title:"MightyHive: AdTech Split Testing (Part 2)",
  description: main_page_content,
  short_description: "A project hosted by MightyHive, an advertising technology company. You will perform data cleaning, de-duplication, and statistical analysis to determine the effectiveness of their marketing technology.",
  number: 29,
  enabled: true,
  has_content_submit: false,
  has_written_submit: true,
  uid: 29,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  company_overview: "",
  is_new: false,
  deadline: 4.hours,
  cover_photo: "mightyhive",
  project_set_id: 0,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

project_overview_content = [
  ['text-info', 'This data challenge is based off of work that was directly done by the analytics team at MightyHive.'],
  ['text', 'We will first begin by describing the data you are provided and the context of the problem MightyHive was facing.'],
  ['text-danger', 'You may complete this challenge in the following languages: R, Python, & MATLAB, but the preferred language is R.'],
  ['lesson_links', nil]
]

project_overview_lesson = Lesson.create!(
  title: "Challenge Overview",
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
  ['text-warning', 'The Abandoned Data Set:'],
  ['link', 'https://s3.amazonaws.com/leada/mh_data/Abandoned_Data_Seed.csv'],
  ['text-warning', 'The Reservation Data Set:'],
  ['link', 'https://s3.amazonaws.com/leada/mh_data/Reservation_Data_Seed.csv'],
  ['text-info', 'There are two types of observations in the two data sets provided.'],
  ['text', 'Abandoned observations are the potential customers who called into the call center but did not make a purchase.'],
  ['text', 'Reservation observations are the customers who called into the call center and made a reservation.'],
]

data_content_two = [
  ['text-info', 'The schema for both of the data sets is provided below:'],
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
  ['text-info', 'The analytics team designed an experiment where the Abandoned observations were randomly split into test and control groups with an approximate 50-50 split.'],
  ['text', 'The Abandoned observations in the test group were retargeted with advertisements online for a period of 7 days.'],
  ['text', 'The control group was never shown any advertisements.'],
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

challenge_part_one = [
  ['text', 'Your overall task is to analyze the data provided and return a conclusion of the effectiveness of the MightyHive Call Center Remarketing product.'],
  ['text', 'There are three parts to completing this project.'],
  ['text', 'Part Two Challenge:'],
  ['text-success', 'With a list of all of the matched Reservation observations, some data de-duplication and cleaning must be performed.'],
  ['text', 'Some customers make multiple bookings for reservations and these must be distilled to a single reservation.'],
  ['text-warning', 'There are also some observations which need to be removed.'],
  ['lesson_links', nil],
]

challenge_lesson = Lesson.create!(
  title: "Part 2 Challenge",
  project: project,
  lesson_id: 1,
)

challenge_slide = Slide.create!(
  content: challenge_part_one,
  parent: challenge_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_cleaning_content_one = [
  ['text-info', 'Let\'s design a process for de-duplication and cleaning for the dataset.'],
  ['text', 'First submit an explanation for your cleaning process.'],
  ['user_response', '#@TODO Include UID'],
]

data_cleaning_content_two = [
  ['text', 'Now submit your code which executes the cleaning process you described:'],
  ['user_code', '#@TODO Include UID'],
]

data_cleaning_content_three = [
  ['text', "The number of matched observations after cleaning should fit within a range:"],
  ['quiz', 'clean_quiz'],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1811239/Project-Feedback-v2'],
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

data_cleaning_slide = Slide.create!(
  content: data_cleaning_content_three,
  parent: data_cleaning_step,
  slide_id: 2,
)

quiz = NumericRangeQuiz.create!(
  quiz_id: "clean_quiz",
  lower_bound: 310.0,
  upper_bound: 423.0,
  project: project,
  slide: data_cleaning_slide_two,
  question: 'How many observations do you have remaning after de-duplication?',
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


