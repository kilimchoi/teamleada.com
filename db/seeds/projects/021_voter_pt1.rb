main_page_content = [
  ['text-info', "In this data challenge we will analyze candidate disbursement data."],
  ['text', "We'll be analyzing various spending record from election candidates."],
  ['text-danger', "Will we uncover some dark political secret?"],
  ['text', "Or will we simply face the same expected government spending?"],
  ['text', "This is Part.1 of the challenge."],
  ['text-success', "We'll start out slow with some simple correlation analysis."],
]


project = Project.create!(
  title: "US Election Candidate Disbursement Data Analytics: Pt1",
  description: main_page_content,
  short_description: "This project will involve working with actual candidate disbursements data released in 2014. You're asked to conduct analysis on spending category, amount, and relative size.",
  number: 21,
  enabled: true,
  has_leaderboard: false,
  has_content_submit: true,
  has_written_submit: true,
  category: Project::CHALLENGE,
  uid: 21,
  difficulty: 'Intermediate',
  is_new: true,
  cover_photo: "voter-pt1",
  deadline: 2.hours,
  project_set_id: 2,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_zero = [
  ['text-success', "You've been hired by an organization to analyze government data."],
  ['text', "Your first task is to analyze the election candidate disbursement data."],
  ['text', "We'll get a little more details about the data here."],
  ['lesson_links', ""],
]

intro_lesson = Lesson.create!(
  title: "Context",
  lesson_id: 0,
  project: project
)

intro_slide = Slide.create!(
  content: intro_content_zero,
  slide_id: 0,
  parent: intro_lesson,
)

################################################################################
data_context_content_zero = [
  ['text-success', "The data is here:"],
  ['link', "ftp://ftp.fec.gov/FEC/data.fec.gov/candidate_disbursement2014/all_house_senate.csv"],
  ['text-warning', "The data results from a federal law that requires political candidates to record the following spending:"],
  ['text', "-   All specific disbursements that are contributions to other federal candidates or parties or other committees as well as all loan repayments."],
  ['text', "-   Other spending of over $200/election-cycle to be reported"],
  ['text', "Now that we know how the data is collected/reported, let's learn about its meta data."],
  ['next_steps', ""],
]

data_context_step = Step.create!(
  title: "Data Context",
  lesson: intro_lesson,
  step_id: 0,
)

data_cotext_slide = Slide.create!(
  content: data_context_content_zero,
  slide_id: 0,
  parent: data_context_step,
)

################################################################################

data_details_content_zero = [
  ['text-success', "The meta data for the columns can be found here"],
  ['link', "http://www.fec.gov/finance/disclosure/metadata/CandidateDisbursements.shtml"],
  ['quiz', "voter_intro_pt1_0"],
  ['text-info', "That's a lot of records!"],
  ['next_steps', ""],
]

data_details_step = Step.create!(
  title: "Data details",
  lesson: intro_lesson,
  step_id: 1,
)

data_details_slide = Slide.create!(
  content: data_details_content_zero,
  slide_id: 0,
  parent: data_details_step,
)

voter_intro_quiz = Quiz.create!(
  quiz_id: "voter_intro_pt1_0",
  answer: "510459",
  project: project,
  slide: data_details_slide,
  question: "How many rows are there in the data? (Be sure to exclude the header.)",
)

################################################################################
######### Data Correlation #####################################################
################################################################################

data_correlation_content = [
  ['text-success', "First, we want to understand the correlations between 'categories' / 'types' of donations. (travel V.S. advertising, for example)"],
  ['text', "This is grouped via the category code."],
  ['text', "Check the link for the metadata from the previous step."],
  ['quiz', "voter_correlation_tag"],
  ['text', "The actual code-to-category mapping can be found here."],
  ['link', "http://www.fec.gov/finance/disclosure/metadata/DisbursementCategoryCodes.shtml"],
  ['text', "Now let's do some analysis."],
]

data_correlation_content_one = [
  ['text-danger', "Group the entries by category type and do a correlation matrix."],
  ['text', "You're encouraged to do other analysis on the dataset for a better analysis, but you're free not to."],
  ['text-success', "Submit the code you used to do the analysis:"],
  ['user_code', "nil"],
  ['text', "Do the results make sense?"],
  ['text', "We'll talk about it next."],
]

data_correlation_content_two = [
  ['text-success', "Write a few sentences about your analysis on the result."],
  ['user_response', "nil"],
  ['text', "Also submit an image of your analysis plot."],
  ['image_submit', ""],
  ['text-warning', "Note that the image will eventually be part of your profile for other users to view."],
  ['next_steps', ""],
]

data_correlation_lesson = Lesson.create!(
  title: "Correlation Analysis",
  lesson_id: 1,
  project: project,
)

data_correlation_slide = Slide.create!(
  slide_id: 0,
  content: data_correlation_content,
  parent: data_correlation_lesson,
)

data_correlation_slide_one = Slide.create!(
  slide_id: 1,
  content: data_correlation_content_one,
  parent: data_correlation_lesson,
)

data_correlation_slide_two = Slide.create!(
  slide_id: 2,
  content: data_correlation_content_two,
  parent: data_correlation_lesson,
)

voter_cor_quiz = Quiz.create!(
  quiz_id: "voter_correlation_tag",
  answer: "cat_cod",
  project: project,
  slide: data_correlation_slide,
  question: "What is the actual column name for 'category code'?",
)

corr_code_submission_context = SubmissionContext.create!(
  title: "Correlation Code",
  description: "User is asked to submit the code used to do the correlation analysis.",
  slide: data_correlation_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
  required: true,
)

corr_response_context = SubmissionContext.create!(
  title: "Correlation Analysis Written",
  description: "User is asked to explain and talk about the analysis result of the categorical correlation analysis",
  slide: data_correlation_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)

################################################################################
############### Conclusion #####################################################
################################################################################

conclusion_content = [
  ['text-success', "Great!"],
  ['text', "You've finished analyzing Part 1 of the analysis on the Candidate Disbursement Data."],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  lesson_id: 3,
  project: project,
)

conclusion_slide = Slide.create!(
  content: conclusion_content,
  slide_id: 0,
  parent: conclusion_lesson,
)

normalization_response_submission_context = SubmissionContext.create!(
  title: "Conclusion on Candidate Disbursement Data",
  description: "User is asked to write down any conclusion after the analysis  of the candidate disebursement data.",
  slide: conclusion_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)

