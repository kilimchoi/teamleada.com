main_page_content = [
  ['text-info', "MightyHive is an advertising technology company that uses retargeting methods to send ads to users online."],
  ['text', "One product, “Call Center Remarketing”, uses call center log data to retarget those consumers online which did not make a purchase."],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
  ['text-success', 'You will be submitting both code and written responses of your analysis and final recommendations.'],
]

project = Project.create!(
  title:"MightyHive: AdTech Split Testing (Part 3)",
  description: main_page_content,
  short_description: "A project sponsored by MightyHive, an advertising technology company. You will perform data cleaning, de-duplication, and statistical analysis to determine the effectiveness of their marketing technology.",
  number: 30,
  enabled: true,
  has_content_submit: false,
  has_written_submit: true,
  uid: 30,
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

experiment_content_one = [
  ['text-info', 'The analytics team designed an experiment where the Abandoned observations were randomly split into test and control groups with an approximate 50-50 split.'],
  ['text', 'The Abandoned observations in the test group were retargeted with advertisements online for a period of 7 days.'],
  ['text', 'The control group was never show any advertisements.'],
  ['text', 'The Reservation observations include observations from both the test and control groups.'],
  ['next_steps', nil]
]

experiment_background = Lesson.create!(
  title: "Challenge Overview",
  project: project,
  lesson_id: 0,
)

experiment_slide = Slide.create!(
  content: experiment_content_one,
  parent: experiment_background,
  slide_id: 0,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


challenge_part_one = [
  ['text-info', 'Your overall task is to analyze the data provided and return a conclusion of the effectiveness of the MightyHive Call Center Remarketing product.'],
  ['text', 'There are three parts to completing this project.'],
  ['text', 'Part Three Challenge:'],
  ['text', 'With the clean data, determine and conduct the appropriate statistical analysis.'],
  ['text-success', 'Define your null hypothesis and calculate the 95% confidence interval for the change in proportion of conversions between test and control groups.'],
  ['lesson_links', nil]
]


challenge_lesson = Lesson.create!(
  title: "Part 3 Challenge",
  project: project,
  lesson_id: 1,
)

challenge_slide = Slide.create!(
  content: challenge_part_one,
  parent: challenge_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

stat_analysis_content_one = [
  ['text-success', 'Define the null hypothesis and determine the appropriate statistical analysis.'],
  ['user_response', '#@TODO Include UID'],
]

stat_analysis_content_two = [
  ['text-success', 'Submit code which performs the statistical analysis including the calculation of the 95% confidence interval.'],
  ['user_code', '#@TODO Include UID'],
  ['text-info', "Make sure to comment your code for readability."],
]

stat_analysis_content_three = [
  ['text', "Now to do a quick check of your analysis."],
  ['quiz', 'stat_quiz'],
]

stat_analysis_content_four = [
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

stat_analysis_slide_four = Slide.create!(
  content: stat_analysis_content_four,
  parent: stat_analysis_step,
  slide_id: 3,
)

quiz = NumericRangeQuiz.create!(
  quiz_id: "stat_quiz",
  upper_bound: 0.01,
  project: project,
  slide: stat_analysis_slide_three,
  question: 'In the box below, enter your p-value:',
)

stat_analysis_context = SubmissionContext.create!(
  title: "Data Analysis Response",
  description: "Define the null hypothesis and determine the appropriate statistical analysis.",
  slide: stat_analysis_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
stat_analysis_context_two = SubmissionContext.create!(
  title: "Data Matching Response",
  description: "Submit code which performs the statistical analysis including the calculation of the 95% confidence interval.",
  slide: stat_analysis_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)
stat_analysis_context_three = SubmissionContext.create!(
  title: "Data Matching Response",
  description: "Submit a conclusion of the results. How effective was the MightyHive advertising product?",
  slide: stat_analysis_slide_three,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

presentation_one = [
  ['text', 'Submit a link to a presentation (2-3 slides) of your analysis and conclusion. Make sure the link is directly viewable online.'],
  ['user_response', ''],
]

presentation_two = [
  ['text', 'Submit a link to a video of you presenting your conclusions to a manager (2 min max). Production quality is not important.'],
  ['text-warning', "Use a webcam and please show yourself speaking."],
  ['user_response', ''],
  ['text-success', "The video is an opportunity for you to show your communication skills."],
  ['next_steps', ""],
]

presentation_lesson = Lesson.create!(
  title: "Presentation Submission",
  project: project,
  lesson_id: 2,
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

  ########################################
  #### -- Concluding Section -- ##########
  ########################################

  concluding_content = [
    ['text', "You've completed the MightyHive Data Challenge!"],
    ['text', "Please make sure you have commented your code thoroughly and both presentation materials (video and slides) are viewable from the link you copy and pasted."],
    ['text-warning', "Remember, top submissions go directly to the hiring manager for interviews!"],
    ['finish_project_button', 'http://www.surveygizmo.com/s3/1811239/Project-Feedback-v2'],
  ]

  concluding_lesson = Lesson.create!(
    title: "Concluding MightyHive Challenge",
    lesson_id: 3,
    project: project,
  )

  concluding_lesson = Slide.create!(
    content: concluding_content,
    slide_id: 0,
    parent: concluding_lesson,
  )






