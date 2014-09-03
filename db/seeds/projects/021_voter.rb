main_page_content = [
  ['text', "In this data lesson we will analyze candidate discbursement data."],
  ['text', "We'll be analyzing various spending record from election candidates."],
  ['text', "Will we uncover some dark politcal secrets?"],
  ['text', "Or will we simply face the same expected government spending?"],
  ['text-success', "Only one way to find out!"],
]


project = Project.create!(
  title: "US Election Candidate Disbursement Data Analytics",
  description: main_page_content,
  short_description: "This project will involve working with actual candidate disbursements data released in 2014. You're asked to conduct analysis on spending type, ca",
  number: 21,
  enabled: true,
  has_leaderboard: false,
  has_submit: true,
  category: Project::CHALLENGE,
  uid: 21,
  difficulty: 'Intermediate',
  is_new: true,
  cover_photo: "voter",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_zero = [
  ['text-success', "You've been hired by an organization to analyze government data."],
  ['text', "Your first task is to analyze the election candidate discbursement data."],
  ['text', "We'll get a little bit more details about the data here."],
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
  ['text', "The data results from a federal law that requires candidate to record the following spendings:"],
  ['text', "- All specific disbursements that are contributions to other federal candidates or parties or other committees as well as all loan repayments."],
  ['text', "- Other spending of over $200/election-cycle to be reported"],
  ['text', "Now that we know how the data is collected/reported, let's learn about its meta data."],
  # ['text', "More info here:"],
  # ['link', "http://www.fec.gov/finance/disclosure/metadata/CandidateDisbursements.shtml"],
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
  ['text', "How many rows are there in the data? (Be sure to exclude the header.)"],
  ['quiz', "voter_intro_0"],
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
  quiz_id: "voter_intro_0",
  answer: "510459",
  project: project,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

data_correlation_content = [
  ['text-success', "First, we want to undersatnd the correlations between 'categories' / 'types' of donations. (travel vs advertising, for example)"],
  ['text', "This is grouped via category code?"],
  ['text', "What is the column name for 'category code'?"],
  ['quiz', "voter_correlation_tag"],
  ['text', "The code mapping can be found here."],
  ['link', "http://www.fec.gov/finance/disclosure/metadata/DisbursementCategoryCodes.shtml"],
  ['text', "Group the entries by category type and do a correlation matrix."],
]

data_correlation_content_one = [
  ['text', "You're encouraged to do other analysis on the dataset for a better anslysis, but you're free not to."],
  ['text-success', "Submit the code you used to do the analysis:"],
  ['user_code', "nil"],
  ['text', "Do the results make sense?"],
  ['text', "We'll talk about it next"],
]

data_correlation_content_two = [
  ['text-success', "Write a few sentences about your analysis on the result."],
  ['user_response', ""],
  ['text', "Also submit an image of your analysis plot."],
  ['image_submit', ""],
  ['text-warning', "Note that the image will eventually be part of your profile for other users to view."],
  ['next_steps', ""],
]


voter_cor_quiz = Quiz.create!(
  quiz_id: "voter_correlation_tag",
  answer: "cat_cod",
  project: project,
)

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

corr_code_submission_context = SubmissionContext.create!(
  title: "Correlation Code",
  description: "User is asked to submit the code used to do the correlation analysis.",
  slide: data_correlation_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
  required: true,
)

corr_response_context = SubmissionContext.create!(
  title: "Correlation Analysis",
  description: "User is asked to explain and talk about the analysis result of the categorical correlation analysis",
  slide: data_correlation_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)
