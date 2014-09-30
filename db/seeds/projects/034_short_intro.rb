
main_page_content = [
  ['text-success', "This is the introductory demo project."],
]

project = Project.create!(
  title:"Leada Demo",
  description: main_page_content,
  short_description: "You'll go through the motion of completing a Leada Project.",
  enabled: true,
  number: 34,
  has_content_submit: true,
  has_written_submit: true,
  uid: 34,
  difficulty: 'Beginner',
  category: Project::CHALLENGE,
  is_new: true,
  featured: true,
  cover_photo: "intro",
  deadline: 30.minutes,
  #is_onboarding: true,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text-info', "Here is the dataset that we'll be woroking with."],
  ['link', "https://s3.amazonaws.com/leada/intro_project/delivery_data.csv"],
  ['text', "The data you downloaded is transaction data from a food delivery company in San Francisco for the past 6 months."],
  ['text-danger', "Your manager wants to determine the frequency of transactions by zipcode."],
  ['text', "You'll create a table of zipcode and number of transactions."],
  ['next_steps', ""],
]

intro_lesson = Lesson.create!(
  title: "Introduction",
  project: project,
  lesson_id: 0,
)

intro_slide_one = Slide.create!(
  parent: intro_lesson,
  content: intro_content_one,
  slide_id: 0,
)

################################################################################
##### Project Details  ##########################################################
################################################################################

project_details_content_one = [
  ['quiz', "short_intro_0"],
  ['text', "Good, now to the main task."],
]

project_details_content_two = [
  ['text-info', "Your task is as follows:"],
  ['text', " - Remove all zipcode entries with the total COUNT of deliveries under 200."],
  ['text', " - Then bucket the COUNT for each zipcode by $ amount in the following range: [$0 - $60], [$60.01 - $120], [$120+]."],
  ['text', "Your resulting columns should look something like this."],
  ['text', "Zipcode - Num Transactions Less than 60 - Num Transactions between 60 and 120 - Num Transactions above 120"],
  ['next_steps', ""],
]

project_details_content_three = [
  ['text', "Submit your code below."],
  ['user_code', ""],
  ['text', "Great!"],
  ['next_steps', ""],
]

project_details_lesson = Lesson.create!(
  title: "Project Details",
  project: project,
  lesson_id: 1,
)

project_details_slide = Slide.create!(
  content: project_details_content_one,
  parent: project_details_lesson,
  slide_id: 0,
)

project_details_slide_two = Slide.create!(
  content: project_details_content_two,
  parent: project_details_lesson,
  slide_id: 1,
)

project_details_slide_three = Slide.create!(
  content: project_details_content_three,
  parent: project_details_lesson,
  slide_id: 2,
)

intro_q = ExactAnswerQuiz.create!(
  quiz_id: "short_intro_0",
  answer: 4319,
  project: project,
  slide: project_details_slide,
  question: "How many transactions were there for the zipcode 94115?",
)

normalization_code_submission_context = SubmissionContext.create!(
  title: "Code Submission for Intro Project",
  description: "User is asked to submit the code used to subset and bucket the delivery data.",
  slide: project_details_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
  required: true,
)

################################################################################
##### Conclusion ###############################################################
################################################################################

conclusion_content_one = [
  ['text-info', "The challenge was aimed at bringing out your creativity and intuition with data without specific directions."],
  ['text-success', "It's entirely possible to arrive at some useful conclusion (big or small) without having to create sophisticated predictive models."],
  ['finish_project_button', "http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form"],
]

final_lesson = Lesson.create!(
  title: "Conclusion - Intro Project",
  project: project,
  lesson_id: 2,
)

final_slide_one = Slide.create!(
  content: conclusion_content_one,
  parent: final_lesson,
  slide_id: 0,
)



