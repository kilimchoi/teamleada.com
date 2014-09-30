
main_page_content = [
  ['text', 'In this challenge, you are tasked with providing insights and analysis for a specific dataset:'],
  ['text-warning', 'Crime data from San Francisco, CA.'],
  ['text', 'You\'ll get the data from the official SF police website.'],
  ['text', 'The project is purposefully open ended, build whatever visualization(s) you want.'],
  ['text-success', "Let your creativity flow"],
]

project = Project.create!(
  title:"Visualizing Crime Data",
  description: main_page_content,
  short_description: "Given a set of recent San Francisco crime data, you are tasked with finding some meaningful insights and creating visualization(s) which presents your findings.",
  enabled: true,
  number: 15,
  has_content_submit: true,
  has_written_submit: true,
  uid: 15,
  difficulty: 'Intermediate',
  category: Project::CHALLENGE,
  is_new: true,
  featured: true,
  grants_project_access: true,
  cover_photo: "crime",
  deadline: 3.hours,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text-info', "You've just been hired by the city of San Francisco to use analytics to combat its crime issues."],
  ['text', "The first task they want to do is to better understand the crime patterns throughout the city."],
  ['text', "You're tasked with creating visualization(s) that will help the city better interpret the crime data that gets updated daily."],
  ['text', "You're aren't given restrictions on plot type and you must come up with your own analysis."],
  ['text', "The crime data can be downloaded below:"],
  ['link', "https://data.sfgov.org/Public-Safety/SFPD-Incidents-Previous-Three-Months/tmnf-yvry?"],
]

intro_content_two = [
  ['text-info', "The data contains many features including district, category, and crime types."],
  ['text', "As mentioned before, the type of visualization is entirely up to you."],
  ['text-warning', "You might want to consider creating plots that encompass the following, but you are not limited to answering these questions:"],
  ['text', " - Where shouldn't you park your car?"],
  ['text', " - What are the safest locations in SF? What days/times are especially dangerous?"],
  ['text', " - Are certain thefts more common in certain areas?"],
  ['text-success', "Make sure to explain in the summary of your findings how your visualization(s) supports your insights."],
]

intro_content_three = [
  ['text-success', "You are free to complete the project in any language/framework you like."],
  ['text', "Be sure to explain the framework and any external packages with proper documentation."],
  ['text', "Remember, having a maintainable & legible codebase leads to good karma :)"],
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
  ['text', "Submit a summary of your analysis (less than 500 words)"],
  ['text-warning', "The report should contain the question you were answering, along with how you used the data to answer it."],
  ['user_response', ""],
]

report_submission_content_two = [
  ['text', "Include the visualization(s) you created by submitting here: "],
  ['text', 'Use the same submit button to submit multiple visualizations. Please do not submit more than 3. Make sure you submit image files! The file type must be a PNG or JPEG.'],
  ['image_submit', nil],
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

report_submission_slide_two = Slide.create!(
  content: report_submission_content_two,
  parent: report_submission_lesson,
  slide_id: 1,
)

report_submission_context = SubmissionContext.create!(
  title: "Report Submission",
  description: "User is asked to submit a summary of his/her analysis.",
  slide: report_submission_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

image_submission_context = SubmissionContext.create!(
  title: "Visualization Submission",
  description: "User is asked to submit an image of their visualization.",
  slide: report_submission_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::IMAGE,
)


################################################################################
##### Video Submission #########################################################
################################################################################


video_submission_content_one = [
  ['text', 'You can optionally submit a 1 minute video presenting your insights and analysis. Pretend it\'s to your superior.'],
  ['text', 'Submit the YouTube link and be sure to make it unlisted!'],
  ['user_response', ""],
  ['next_steps', ""],
]

video_lesson = Lesson.create!(
  title: "Video Submission (Optional)",
  project: project,
  lesson_id: 3,
)

video_slide = Slide.create!(
  content: video_submission_content_one,
  parent: video_lesson,
  slide_id: 0,
)

video_submission_context = SubmissionContext.create!(
  title: "Video Submission",
  description: "User is asked to submit a 1 minute video presenting their analysis and findings.",
  slide: video_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK,
  required: false,
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
  title: "Conclusion",
  project: project,
  lesson_id: 4,
)

final_slide_one = Slide.create!(
  content: conclusion_content_one,
  parent: final_lesson,
  slide_id: 0,
)



