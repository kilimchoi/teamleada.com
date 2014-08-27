
main_page_content = [
  ['text', 'In this project, you\'ll be building visualizations for a specific dataset:'],
  ['text-warning', 'Crime data from San Francisco, CA.'],
  ['text', 'You\'ll get the data from the official SF police website.'],
  ['text', 'The project is rather open ended, and you can build whatever visualization you want.'],
  ['text-success', "Follow your creativity calling!"],
]

project = Project.create!(
  title:"visualizing Crime Data",
  description: main_page_content,
  short_description: "A data project focused on visualization and reporting. You'll be given a set of recent San Francisco crime data. You'll be reponsible for creating meaninful visualizations and reporting your analysis.",
  number: 15,
  enabled: true,
  has_submit: true,
  uid: 15,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 10.days,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text-info', "You've just been hired by the SF city to better deal with its crime issues."],
  ['text', "First thing they want to do is to better understand crime pattern."],
  ['text', "You're tasked to create visualizations that will help the city better interpret the crime."],
  ['text', "You're not given a specific plot/chart speficiation, and you must come up with your own analysis."],
  ['text', "The crime data can be downloaded below."],
  ['link', "https://data.sfgov.org/Public-Safety/SFPD-Incidents-Previous-Three-Months/tmnf-yvry?"],
  ['text', "How many months of data do you get?"],
  ['quiz', "crime_viz_0"],
]

intro_content_two = [
  ['text-info', "The data contains geographic area, as well as crime types."],
  ['text', "As mentioned before, the type of visualization is entirely up to you."],
  ['text-warning', "You might want to consider creatings plots that encompasses the following:"],
  ['text', " - Time the crime occured"],
  ['text', " - Geo-Location of the crime"],
  ['text', " - Type of the crime occured"],
  ['text', " - And more!"],
  ['text-success', "Make sure to explain in your report why you chose to create the visualization you created."],
]

intro_content_three = [
  ['text-success', "Lastly, you're free to complete the project in any language/framework you like."],
  ['text', "But be sure to explain the framework and any external packages."],
  ['text', "Remember, having maintainable/legible codebase is always a plus!"],
  ['next_steps', ""],
]

quiz = Quiz.create!(
  quiz_id: "crime_viz_0",
  answer:"3",
)

intro_lesson = Lesson.create!(
  title: "Intro / Context",
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

intro_slide_thre = Slide.create!(
  parent: intro_lesson,
  content: intro_content_three,
  slide_id: 2,
)

################################################################################
##### Code Submission ##########################################################
################################################################################

code_submission_content_one = [
  ['text', "Submit your code below."],
  ['text-success', "Remember that your code will be evaluated by another human being."],
  ['text-warning', "This means the following:"],
  ['text', " - Write legible code."],
  ['text', " - Write well-commented code."],
  ['text', " - Write efficient code."],
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
  title: "Src Code",
  description: "User is asked to submit the src code for the project.",
  slide: code_submission_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)

################################################################################
##### Reoport Submission #######################################################
################################################################################

report_submission_content_one = [
  ['text', "Submit a link to yaur report (in PDF) below."],
  ['text-warning', "The report should contain the context of the problem, along with what you decided to do."],
  ['text', "Include the visualization you created (or screenshots if you created interactive ones.)"],
  ['text-success', "If you're able to derive any conclusion from your analysis (though that is not required), be sure to highlight it."],
  ['text', ""],
  ['user_response', ""],
  ['next_steps', ""],
]

report_submission_lesson = Lesson.create!(
  title: "Report Submission",
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
  ['text', "Hopefully you enjoyed creating visualizations for the crime data."],
  ['text-info', "The project was aimed at bringing out your creativity and ability to poke at a piece of data without little or no direction."],
  ['text-success', "It's entirely possible to arrive at some useful conclusion (big or small) without having to create sophisticated predictive models."],
  ['text-warning', "Well done!"],
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



