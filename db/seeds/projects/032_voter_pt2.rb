main_page_content = [
  ['text-info', "This is Part 2 of the challenge."],
  ['text', "We'll be working with the same data from Part 1."],
  ['text', "Therefore context/intro section is the same as before."],
  ['text-warning', "But we'll do a more detailed analysis of the data."],
  ['text-success', "Let's get started!"],
]

project = Project.create!(
  title: "US Election Candidate Disbursement Data Analytics (Part 2)",
  description: main_page_content,
  short_description: "This project will involve working with actual candidate disbursements data released in 2014. You're asked to conduct analysis on spending category, amount, and relative size.",
  number: 32,
  enabled: true,
  has_leaderboard: false,
  has_content_submit: true,
  has_written_submit: true,
  category: Project::CHALLENGE,
  uid: 32,
  difficulty: 'Intermediate',
  is_new: true,
  deadline: 2.hours,
  cover_photo: "voter-pt2",
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
  ['link', "https://s3.amazonaws.com/leada/rnc_challenge/all_house.tar"],
  ['text-warning', "The data results from a federal law that requires political candidates to record the following spending:"],
  ['text', "-   All specific disbursements that are contributions to other federal candidates, parties, or other committees including loan repayments."],
  ['text', "-   Other spending of over $200/election-cycle."],
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


################################################################################
######### ANOVA Analysis #######################################################
################################################################################

distribution_lesson_content = [
  ['text-success', "Find out how much the distribution of 'sizes' of disbursements appears to differ from campaign to campaign."],
  ['text', " - Are the sizes just a function of total campaign spent?"],
  ['text', " - Are they related to the vendors?"],
  ['text-info', "You're free to do any analysis you want."],
  ['text-warning', "(Though ANOVA would be a good start!)"],
]

distribution_lesson_content_one = [
  ['text-success', "Write the code that will provide the analysis."],
  ['text', "Remember to comment clearly on what you're doing."],
  ['text', "You'll also explain your procedure and any results on the next section."],
  ['user_code', ""],
]

distribution_lesson_content_two = [
  ['text-success', "How did you analyze the differences in spending? Defend your choice for statistical analysis."],
  ['text', "What did you conclude?"],
  ['user_response', "nil"],
  ['next_steps', ""],
]
distribution_lesson = Lesson.create!(
  title: "ANOVA on Candidate spending",
  lesson_id: 1,
  project: project,
)

distribution_lesson_slide = Slide.create!(
  content: distribution_lesson_content,
  slide_id: 0,
  parent: distribution_lesson,
)

distribution_lesson_slide_one = Slide.create!(
  content: distribution_lesson_content_one,
  slide_id: 1,
  parent: distribution_lesson,
)

distribution_lesson_slide_two = Slide.create!(
  content: distribution_lesson_content_two,
  slide_id: 2,
  parent: distribution_lesson,
)

anova_code_submission_context = SubmissionContext.create!(
  title: "Spending Analysis Code",
  description: "User is asked to submit the code used to analyze the difference in spending between campaigns.",
  slide: distribution_lesson_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
  required: true,
)

anova_response_context = SubmissionContext.create!(
  title: "Spending Analysis Written",
  description: "User is asked to explain and talk about the analysis result of the spending between campaigns.",
  slide: distribution_lesson_slide_two,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)

################################################################################
######### Conclusion ###########################################################
################################################################################

conclusion_content = [
  ['text-success', "Great!"],
  ['text', "You've finished Part 2 of the Candidate Disbursement Data Analysis."],
  ['text', "Hopefully you're getting a better grasp of the underlying trends in the data."],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1811239/Project-Feedback-v2'],
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
