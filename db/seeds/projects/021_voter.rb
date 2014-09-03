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

