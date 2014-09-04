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
######### Data Correlation #####################################################
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
  ['user_response', "nil"],
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

################################################################################
######### Data Correlation #####################################################
################################################################################

distribution_lesson_content = [
  ['text-success', "We want to find out how much the distribution of 'sizes' of disbursements appears to differ from campaign to campaign."],
  ['text', " - Are the size just a function of total campaign spend?"],
  ['text', " - Are they related to the vendors?"],
  ['text-info', "You're free to do any analysis you want."],
]

distribution_lesson_content_one = [
  ['text-success', "Write the code that will provide the analysis above"],
  ['text', "Remember to comment clearly on what you're doing"],
  ['text', "You'll also explain your procedure and any results on the next section"],
  ['user_code', ""],
]

distribution_lesson_content_two = [
  ['text-success', "How did you analyze the difference in spending?"],
  ['text', "What did you conclude?"],
  ['user_response', "nil"],
  ['next_steps', ""],
]
distribution_lesson = Lesson.create!(
  title: "ANOVA on Candidate spending",
  lesson_id: 2,
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
######### Data Normalization ###################################################
################################################################################

normalization_content_one = [
  ['text-success', "After some analysis, you notice large discrepancies in candidate spending depending on the region / campaign."],
  ['text', "You assume that the variance can be explained by the differences in populations between regions."],
  ['text', "To test your intuition, you decide to normalize the campaign data by population size."],
  ['text', "After some googling, you end up with you the following US Census population data (2010)"],
  ['link-fail', "link to the data."],
  ['text', "Equipped with this additional data, you begin your analysis"],
]

normalization_content_two = [
  ['text', "Write the code that accomplishes the following:"],
  ['text', " - Campaign dollar spent per State"],
  ['text', " - Campaign dollar"],
  ['text', " - Any other anomaly that you want to investigate"],
  ['user_code', ""],
  ['text', "Good, let's now discuss your findings."],
]

normalization_content_three = [
 ['text-success', "Explain what you did to complete your analysis."],
 ['text', "Be sure to include the reasonings behind your approach and any conclusions drew."],
 ['user_response', ""],
 ['next_steps', ""],
]

normalization_lesson = Lesson.create(
  title: "Normalization",
  lesson_id: 3,
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
######### Data Normalization ###################################################
################################################################################

conclusion_content = [
  ['text', "Great!"],
  ['text', "You've finished analyzing the candidate discbursement Data"],
  ['text', "Hopefully you now have a better sense of how the 2014 candidate disbursement happened."],
  ['text', "Write any conclusion you drew from the excercises. You're free to leave it blank, if you were unable to draw any conclusive result"],
  ['user_response',""],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  lesson_id: 4,
  project: project,
)

conclusion_slide = Slide.create!(
  content: conclusion_content,
  slide_id: 0,
  parent: conclusion_lesson,
)

normalization_response_submission_context = SubmissionContext.create!(
  title: "Conclusion on Candidate Discbursement data",
  description: "User is asked to write down any concusion after the analyis of the candidate disebursement data.",
  slide: conclusion_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
  required: true,
)

