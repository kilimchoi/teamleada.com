
main_page_content = [
  ['text-info', "In this challenge, you're given the opportunity to create a movie recommender."],
  ['text', "You're given the MovieLens data, which contains the following"],
  ['text', "  - 6,000+     Users"],
  ['text', "  - 3,900      Movies"],
  ['text', "  - 1,000,000+ movie ratings"],
  ['text-warning', "The data was collected by the GroupLens Research Project at University of Minnesota."],
  ['text-success', "Special thanks to Dr. Konstan who gave us the permission to link the data for your use!"], 
  ['link-success', "http://www.grouplens.org/"],
  ['text', "Let's get started!"],
]

project = Project.create!(
  title:"Movie Recommendation Engine",
  description: main_page_content,
  short_description: "With a large set of user movie reviews, you're going to build a movie recommendation engine!",
  enabled: true,
  number: 22,
  has_written_submit: true,
  has_content_submit: false,
  uid: 22,
  difficulty: 'Expert',
  category: Project::CHALLENGE,
  is_new: true,
  featured: true,
  cover_photo: "movielens",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text', "How does Netflix always know what you want to watch next?"],
  ['text', "Wired.com reports:"],
  ['text-info', "\"(Netflix estimates that) 75 percent of viewer activity is driven by recommendation.\""],
  ['text', "How do they do it?"],
  ['text', "To start, they have 100s of millions to billions of rows of viewer data."],
  ['text', "In those viewer data, there are people who share similar taste as you."],
  ['text', "By looking at people with similar viewing/rating history as you, they're able to recommend movies that people similar to you enjoyed."],
]

intro_content_two = [
  ['text', "But how do you systematically predict what we talked about?"],
  ['text-success', "We're going to use collborate filtering"],
  ['text', "The idea is to start with a giant matrix of user reviews, where every user has reviewed every movie."],
  ['text', "Of course, some entries will be empty, since not everyone has reviewed every movie"],
  ['text-warning', "(in fact, has anyone reviewed every movie?)"],
  ['text', "In this projectm you will implement a collaborative filtering algorithm to predict what movie a particular user might enjoy."],
  ['lesson_links', ""],
]

introduction_lesson = Lesson.create!(
  title: "Data Introduction",
  project: project,
  lesson_id: 0,
)

intro_slide_one = Slide.create!(
  parent: introduction_lesson,
  content: intro_content_one,
  slide_id: 0,
)
intro_slide_two = Slide.create!(
  parent: introduction_lesson,
  content: intro_content_two,
  slide_id: 1,
)

################################################################################

data_intro_one = [
  ['text-info', "The data we're going to use is from the GroupLens project at University of Minnesota."],
  ['text', "Download the data here:"],
  ['link', "http://files.grouplens.org/datasets/movielens/ml-1m.zip"],
  ['text-success', "It is taken from the MovieLens user data:"],
  ['link', "http://movielens.umn.edu/"],
  ['text-warning', "The dataset contains the following files."],
  ['code', "ratings.dat"],
  ['code', "users.dat"],
  ['code', "movies.dat"],
  ['code', "README"],
  ['text-danger', "Special thanks to Dr. Joseph A. Konstan!"],
  ['next_steps', ""],
]

data_intro_step = Step.create!(
  title: "MovieLens Data",
  step_id: 0,
  lesson: introduction_lesson,
)

data_intro_slide_one = Slide.create!(
  content: data_intro_one,
  slide_id: 0,
  parent: data_intro_step,
)

################################################################################

goal_intro_one = [
  ['text', "Your goal is to construct a model that can output movie recommendations for a specific user."],
  ['text-warning', "You'll be given the following input:"],
  ['text', "  - User's relevant info"],
  ['text', "  - Rating history"],
  ['text-warning', "And expect to get back the following:"],
  ['text', "  - A list of movies that the user might enjoy"],
  ['text', "  - Expected user rating for each of the predicted movies"],
  ['text-success', "Be prepared to explain how you benchmarked/evaluated your model."],
  ['text', "Let's get started!"],
  ['next_steps', ""],
]

goal_intro_step = Step.create!(
  title: "Project Goal",
  step_id: 1,
  lesson: introduction_lesson,
)

goal_intro_slide_one = Slide.create!(
  content: goal_intro_one,
  slide_id: 0,
  parent: goal_intro_step,
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
  ['text', 'Use the same submit button to submit multiple visualizations. Make sure you submit image files! The file type must be a PNG or JPEG.'],
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
  description: "User is asked to submit a link to the report.",
  slide: report_submission_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
##### Video Submission #########################################################
################################################################################


video_submission_content_one = [
  ['text', 'You can optionally submit a 1 minute video presenting your insights and analysis. Pretend its to your superior.'],
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
  submission_type: SubmissionContext::RESPONSE,
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



