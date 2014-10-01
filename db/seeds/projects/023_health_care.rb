
main_page_content = [
  ['text-info', "In this project, you'll get a comprehensive case study of working with Healthcare Data."],
  ['text', "In Pt.1, we'll focus on Data Aggregation."],
  ['text-warning', "Often times when working in the health industry, you have to deal with multiple sources of data."],
  ['text', "You have to assess the data quality of each individual sources, and come up with a way to combine them."],
  ['text', "We'll work on combining a myriad of data sources to create a single dataset."],
  ['text-success', "Let's get started."],
]

project = Project.create!(
  title:"Healthcare Cost Analytics Part 1 Data Aggregation",
  description: main_page_content,
  short_description: "In this part 1 (of three) of the Healthcare Analytics, you'll be conducting data aggregation of healthcare data from various sources. In part 2 and 3, you'll deal with analyzing the aggregated data.",
  enabled: true,
  number: 23,
  has_content_submit: false,
  has_written_submit: true,
  uid: 23,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 1.hours,
  featured: true,
  cover_photo: "health-1",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text-info', "You have a group of datasets related to Healthcare."],
  ['text', "Each dataset contains part of the picture."],
  ['text', "Your job is to aggregate the dataset into a single file."],
]

intro_content_two = [
  ['next_steps', ""],
]

intro_lesson = Lesson.create!(
  title: "Data Intro",
  project: project,
  lesson_id: 0,
)

intro_slide_one = Slide.create!(
  parent: intro_lesson,
  content: intro_content_one,
  slide_id: 0,
)
intro_slide_two = Slide.create!(
  parent: intro_lesson,
  content: intro_content_two,
  slide_id: 1,
)

################################################################################
##### Code Submission ##########################################################
################################################################################

code_submission_content_one = [
  ['text-info', "Submit your code below."],
  ['text-success', "Remember that your code will be evaluated by another human being."],
  ['text', " - Write legible code"],
  ['text', " - Write well-commented code"],
  ['text', " - Write efficient code"],
  ['user_code', ""],
  ['next_steps', ""],
]

code_submission_lesson = Lesson.create!(
  title: "Code Submission",
  project: project,
  lesson_id: 1,
)

code_submission_slide = Slide.create!(
  content: code_submission_content_one,
  parent: code_submission_lesson,
  slide_id: 0,
)

code_submission_context = SubmissionContext.create!(
  title: "Source Code",
  description: "User is asked to submit the source code for the project.",
  slide: code_submission_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################
##### Reoport Submission #######################################################
################################################################################

report_submission_content_one = [
  ['text', "Submit a summary of what you did (less than 500 words)"],
  ['user_response', ""],
  ['next_steps', ""],
]

report_submission_lesson = Lesson.create!(
  title: "Summary Submission",
  project: project,
  lesson_id: 2,
)

report_submission_slide = Slide.create!(
  content: report_submission_content_one,
  parent: report_submission_lesson,
  slide_id: 0,
)

report_submission_context = SubmissionContext.create!(
  title: "Report Submission",
  description: "User is asked to submit a link to the report.",
  slide: report_submission_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
##### Conclusion ###############################################################
################################################################################

conclusion_content_one = [
  ['text-info', "Now that we have the data aggregated, we can work on builing a model."],
  ['text', "We'll focus on the model in Pt.2"],
  ['finish_project_button', "http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form"],
]

final_lesson = Lesson.create!(
  title: "Conclusion",
  project: project,
  lesson_id: 3,
)

final_slide_one = Slide.create!(
  content: conclusion_content_one,
  parent: final_lesson,
  slide_id: 0,
)



