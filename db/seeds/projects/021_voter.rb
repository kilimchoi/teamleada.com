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
  ['text', "You've been hired to analyze election candidate discbursement data."],
  ['text', "The data is from the following:"],
  ['link', "ftp://ftp.fec.gov/FEC/data.fec.gov/candidate_disbursement2014/all_house_senate.csv"],
  ['text', "The data results from a federal law that requires candidate to record the following spendings:"],
  ['text', "- All specific disbursements that are contributions to other federal candidates or parties or other committees as well as all loan repayments."],
  ['text', "- Other spending of over $200/election-cycle to be reported"],
  ['text', "More info here:"],
  ['link', "http://www.fec.gov/finance/disclosure/metadata/CandidateDisbursements.shtml"],
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

