
main_page_content = [
  ['text', "In this challenge, we will build off of the flu trends data lesson."],
  ['text', "You are given a new dataset to build a time series model."],
  ['text', "You are given a time frame, as well as a submission count limit."],
  ['text', "You will be evaluated on the complexity of the model and the accuracy of your predictions."],
  ['text-success', "Good Luck!"],
]

project = Project.create!(
  title:"Time Series Challenge",
  description: main_page_content,
  short_description: "In this challenge you will be tasked with building a time series model. You are free to use any package or language. You will be evaluated on the accuracy of the model as well as it's complexity. You will also submit a short report and presentation of your analysis.",
  number: 17,
  enabled: true,
  uid: 17,
  has_leaderboard: true,
  has_submit: true,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 2.weeks,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
main_page_content = [
  ['text', "You are given 4 datasets."],
  ['text', "You are asked to fit a time series model on 2 of them (choose 2, and you can ignore the rest)."],
  ['text', "You will have to create predictions over the next 100 periods on both of the datasets you chose."],
  ['text', "You will instantly receive a score on your accuracy."],
  ['text', "Lastly, you are tasked with a writeup and presentation of your process."],
  ['next_steps', nil],
]

main_page_lesson = Lesson.create!(
  title: "Challenge Details",
  project: project,
  lesson_id: 0,
)

main_page_slide = Slide.create!(
  content: main_page_content,
  parent: main_page_lesson,
  slide_id: 0,
)

################################################################################
#### Deliverables ##############################################################
################################################################################

deliverables_content_one = [
  ['text-info', "You will submit the following deliverables:"],
  ['text', " - All source code which you used to make your predictions."],
  ['text', " - Two separate predictions for the 2 datasets you selected."],
  ['text', " - Reporting for your result and a presentation of your findings."],
  ['next_steps', nil],
]

deliverables_lesson = Lesson.create!(
  title: "Challenge Deliverables",
  project: project,
  lesson_id: 1,
)

main_page_slide = Slide.create!(
  content: deliverables_content_one,
  parent: deliverables_lesson,
  slide_id: 0,
)

################################################################################
#### Data Context ##############################################################
################################################################################

data_content_one = [
  ['text', "The data for this project is located at:"],
  ['link', "https://s3.amazonaws.com/leada/time_series_challenge/challenge_data.csv"],
  ['text', "The data comes in csv format and includes headers."],
  ['text', "All datasets have undergone a certain level of normalization."],
  ['next_steps', nil],
]

data_lesson = Lesson.create!(
  title: "Data",
  project: project,
  lesson_id: 2,
)

main_page_slide = Slide.create!(
  content: data_content_one,
  parent: data_lesson,
  slide_id: 0,
)

################################################################################
#### Submission ################################################################
################################################################################

submission_content_one = [
  ['text', "There are 3 different submissions you will need to make to complete this challenge."],
  ['text', "There will be more details at each level:"],
  ['lesson_links', nil],
]

deliverables_lesson = Lesson.create!(
  title: "Submissions",
  project: project,
  lesson_id: 3,
)

main_page_slide = Slide.create!(
  content: submission_content_one,
  parent: deliverables_lesson,
  slide_id: 0,
)

################################################################################

submission_src_content_one = [
  ['text-success', "Paste in all your source code below:"],
  ['text', "Be sure to have concise and informative comments."],
  ['text', "If you used any non-standard packages, explain the sources in the comments."],
  ['user_code', ""],
  ['next_steps', nil],
]

submission_src_step = Step.create!(
  title: "Source Code",
  lesson: deliverables_lesson,
  step_id: 0,
)

submission_slide_one = Slide.create!(
  content: submission_src_content_one,
  parent: submission_src_step,
  slide_id: 0,
)

timeseries_src_submission = SubmissionContext.create!(
  title: "Source Code Submission",
  description: "User is asked to submit the code used to create/predict with a time series model.",
  slide: submission_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################

submission_prediction_content_one = [
  ['text-info', "PREDICTION 1"],
  ['text-success', "Paste in your first set of predictions below:"],
  ['text', "The first line should specify which series you are predicting."],
  ['text-danger', "From the 2nd line, include a single value per line, with comma optional (the submission should be 101 lines.)"],
  ['user_code', ""],
]

submission_prediction_content_two = [
  ['text-info', "PREDICTION 2"],
  ['text-success', "Paste in your second set of predictions below:"],
  ['text', "The first line should specify which series you are predicting."],
  ['text-danger', "From the 2nd line, include a single value per line, with comma optional (the submission should be 101 lines.)"],
  ['user_code', ""],
  ['next_steps', nil],
]

submission_prediction_step = Step.create!(
  title: "Predictions",
  lesson: deliverables_lesson,
  step_id: 1,
)

submission_slide_one = Slide.create!(
  content: submission_prediction_content_one,
  parent: submission_prediction_step,
  slide_id: 0,
)

submission_slide_two = Slide.create!(
  content: submission_prediction_content_two,
  parent: submission_prediction_step,
  slide_id: 1,
)

prediciton_submission_one= SubmissionContext.create!(
  title: "Prediction 1 Submission",
  description: "User is asked to submit the prediction for the first dataset chosen.",
  slide: submission_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

prediciton_submission_two = SubmissionContext.create!(
  title: "Prediction 2 Submission",
  description: "User is asked to submit the prediction for the second dataset chosen.",
  slide: submission_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################

submission_reporting_content_one = [
  ['text', "Written Report:"],
  ['text', "Should probably put some details about what we want the report to look like. At least word count."],
  ['text-success', "Paste in a link to your report:"],
  ['user_response', ""],
  ['next_steps', nil],
]

submission_reporting_step = Step.create!(
  title: "Report and Presentation",
  lesson: deliverables_lesson,
  step_id: 2,
)

submission_report_slide_one = Slide.create!(
  content: submission_reporting_content_one,
  parent: submission_reporting_step,
  slide_id: 0,
)

submission_reporting_submission = SubmissionContext.create!(
  title: "Report and Presentation Submission",
  description: "User is asked to submit the reporting for the prediction/process.",
  slide: submission_report_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################

conclusion_content_one = [
  ['text', "Congratulations! You are done! When you are sure your submissions are complete click the complete project button to provide feedback!"],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  project: project,
  lesson_id: 4,
)

conclusion_slide = Slide.create!(
  content: conclusion_content_one,
  parent: conclusion_lesson,
  slide_id: 0,
)


