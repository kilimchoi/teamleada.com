main_page_content = [
  ['text', "In this data challenge we will analyze candidate disbursement data."],
  ['text', "We'll be analyzing various spending record from election candidates."],
  ['text-danger', "Will we uncover some dark political secret?"],
  ['text', "Or will we simply face the same expected government spending?"],
  ['text-success', "Only one way to find out!"],
]


project = Project.create!(
  title: "US Election Candidate Disbursement Data Analytics: Pt.3",
  description: main_page_content,
  short_description: "This project will involve working with actual candidate disbursements data released in 2014. You're asked to conduct analysis on spending category, amount, and relative size.",
  number: 33,
  enabled: true,
  has_leaderboard: false,
  has_content_submit: true,
  has_written_submit: true,
  category: Project::CHALLENGE,
  uid: 33,
  difficulty: 'Intermediate',
  is_new: true,
  cover_photo: "voter",
  deadline: 1.hours,
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
  slide: data_details_slide,
  question: "How many rows are there in the data? (Be sure to exclude the header.)",
)

################################################################################
######### Data Normalization ###################################################
################################################################################

normalization_content_one = [
  ['text-success', "After some analysis, you notice large discrepancies in candidate spending depending on the region / campaign."],
  ['text', "You assume that the variance can be explained by the differences in populations between regions."],
  ['text', "To test your intuition, you decide to normalize the campaign data by population size."],
  ['text', "After some Googling, you end up with you the following US Census population data (2010)."],
  ['link-fail', "link to the data."],
  ['text', "Equipped with this additional data, you begin your analysis."],
]

normalization_content_two = [
  ['text-success', "Write the code that analyzes the following:"],
  ['text', " - Campaign dollar spent per State"],
  ['text', " - Campaign dollar"],
  ['text', " - Any other anomaly that you want to investigate"],
  ['user_code', ""],
  ['text', "Good, let's now discuss your findings."],
]

normalization_content_three = [
 ['text-success', "Explain what you did to complete your analysis."],
 ['text', "Be sure to include the reasoning behind your approach and any conclusion you drew."],
 ['user_response', ""],
 ['next_steps', ""],
]

normalization_lesson = Lesson.create(
  title: "Normalization",
  lesson_id: 1,
  project: project,
)

normalization_slide_one = Slide.create!(
  content: normalization_content_one,
  slide_id: 0,
  parent: normalization_lesson,
)

normalization_slide_two = Slide.create!(
  content: normalization_content_two,
  slide_id: 1,
  parent: normalization_lesson,
)

normalization_slide_three = Slide.create!(
  content: normalization_content_three,
  slide_id: 2,
  parent: normalization_lesson,
)

normalization_code_submission_context = SubmissionContext.create!(
  title: "Normalization Analysis Code",
  description: "User is asked to submit the code used to normalize campaign data per region.",
  slide: normalization_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
  required: true,
)

normalization_response_submission_context = SubmissionContext.create!(
  title: "Spending Analysis Written",
  description: "User is asked to explain the normalized analysis of campaign spending.",
  slide: normalization_slide_three,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)

################################################################################
######### Conclusiong ##########################################################
################################################################################

conclusion_content = [
  ['text-success', "Great!"],
  ['text', "You've finished analyzing the Candidate Disbursement Data."],
  ['text', "Hopefully you now have a better sense of how the 2014 candidate disbursement happened."],
  ['text-info', "Write any conclusion you drew from the project."],
  ['user_response',""],
  ['text-warning', "You're free to leave it blank (by writing NA), if you were unable to draw any conclusive result."],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  lesson_id: 2,
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

