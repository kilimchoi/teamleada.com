
main_page_content = [
  ['text', "In this project, we'll build off of the flu trend project."],
  ['text', "- You're given a new dataset to build a new time series model."],
  ['text', "- You're given a timeframe, as well as a submission count limit"],
  ['text', "- You'll be evaluated on the complexity of the model and also the accuracy of your predictions"],
  ['text', "Good Luck!"],
]

project = Project.create!(
  title:"Time Series Challenge",
  description: main_page_content,
  short_description: "This is a project where you'll be asked to build a time series model on a piece of data. You're free to use any package or language. You'll be judged on the accuracy of the model as well as the complexity of the model.",
  number: 17,
  enabled: true,
  uid: 17,
  has_leaderboard: true,
  has_submit: true,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
main_page_content = [
  ['text', 'The premise of the project is as follows:'],
  ['text', "- You are given 3 datasets."],
  ['text', "- You're asked to fit a time series model on 2 of them (choose 2, and you can ignore the rest)."],
  ['text', "- You'll have to create a prediction over the next 100 periods on both of the datasets you chose."],
  ['text', "- You'll instantly receive a score on your accuracy."],
  ['text', "- Lastly, you're asked to writeup/present your process."],
  ['next_steps', nil],
]

main_page_lesson = Lesson.create!(
  title: "Time Series Challenge: Context",
  project: project,
  lesson_id: 0,
)

main_page_slide = Slide.create!(
  content: main_page_content,
  parent: main_page_lesson,
  slide_id: 0,
)

################################################################################


################################################################################
#### Deliverables ##############################################################
################################################################################

deliverables_content_one = [
  ['text', "Deliverables:"],
  ['text', "- Src Code for your prediction."],
  ['text', "- 2 separate prediction for the 2 datasets."],
  ['text', "- Reporting for your result / process."],
  ['next_steps', nil],
]

deliverables_lesson = Lesson.create!(
  title: "Time Series Challenge: Deliverables",
  project: project,
  lesson_id: 1,
)

main_page_slide = Slide.create!(
  content: deliverables_content_one,
  parent: deliverables_lesson,
  slide_id: 0,
)

################################################################################
#### Submission ################################################################
################################################################################

submission_content_one = [
  ['text', "Submissions:"],
  ['text', "There will be more details at each level:"],
  ['lesson_links', nil],
]

deliverables_lesson = Lesson.create!(
  title: "Time Series Challenge: Submissions",
  project: project,
  lesson_id: 2,
)

main_page_slide = Slide.create!(
  content: submission_content_one,
  parent: deliverables_lesson,
  slide_id: 0,
)

################################################################################

submission_src_content_one = [
  ['text', "Paste in your src code below:"],
  ['text', "Make sure to have concise and informative comments."],
  ['text', "If you used any non-standard packages, expeain the sources in the comments."],
  ['user_code', ""],
  ['next_steps', ""],
]

submission_src_step = Step.create!(
  title: "Src Submission",
  lesson: deliverables_lesson,
  step_id: 0,
)

submission_slide_one = Slide.create!(
  content: submission_src_content_one,
  parent: submission_src_step,
  slide_id: 0,
)

timeseries_src_submission = SubmissionContext.create!(
  title: "Time Series Src",
  description: "User is asked to submit the code used to create/predict with a time series model.",
  slide: submission_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################

submission_prediction_content_one = [
  ['text', "Paste in your 1st prediction below:"],
  ['text', "First line should specify which series you're predicting."],
  ['text', "From the 2nd line, include a single value per line, with comma optional (the submission should be 101 lines.)"],
  ['user_code', ""],
]

submission_prediction_content_two = [
  ['text', "Paste in your 2nd prediction below:"],
  ['text', "First line should specify which series you're predicting."],
  ['text', "From the 2nd line, include a single value per line, with comma optional (the submission should be 101 lines.)"],
  ['user_code', ""],
  ['next_steps', ""],
]

submission_prediction_step = Step.create!(
  title: "Prediction Submission",
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
  title: "Time Series Prediciton 1",
  description: "User is asked to submit the prediction for the first dataset chosen.",
  slide: submission_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

prediciton_submission_two = SubmissionContext.create!(
  title: "Time Series Prediction 2",
  description: "User is asked to submit the prediction for the second dataset chosen.",
  slide: submission_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################

submission_reporting_content_one = [
  ['text', "Written Report:"],
  ['text', "Paste in a link to your report:"],
  ['user_code', ""],
  ['next_steps', ""],
]

submission_reporting_step = Step.create!(
  title: "Time Series: Reporting",
  lesson: deliverables_lesson,
  step_id: 2,
)

submission_report_slide_one = Slide.create!(
  content: submission_reporting_content_one,
  parent: submission_reporting_step,
  slide_id: 0,
)

submission_reporting_submission = SubmissionContext.create!(
  title: "Time Series Report",
  description: "User is asked to submit the reporting for the prediction/process.",
  slide: submission_report_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################

conclusion_content_one = [
  ['text', "Congratz! You're done!"],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Time Series Challenge: Conclusion",
  project: project,
  lesson_id: 3,
)

conclusion_slide = Slide.create!(
  content: conclusion_content_one,
  parent: conclusion_lesson,
  slide_id: 0,
)


