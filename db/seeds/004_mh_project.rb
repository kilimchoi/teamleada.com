
# Main Page

main_page_content = [
  ['text','MightyHive is an advertising technology company that uses retargeting methods to send ads to users online. One product, “Call Center Remarketing”, uses call center logs to show online advertisements to consumers who have recently called into a clients call center.'],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
]

project = Project.create!(
  title:"MightyHive",
  description: main_page_content,
  number: 5,
  enabled: true,
  paid: true,
  cost: 500
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################


project_intro_content = [
  ['text', 'This project is based off of work that was directly done by the analytics team at MightyHive.'],
  ['text', 'We will first begin by describing the data you will be working with and the context of the problem MightyHive was facing'],
  ['lesson_links', nil]
]


project_intro_lesson = Lesson.create!(
  title: "Project Introduction",
  project: project
)

project_intro_slide = Slide.create!(
  content: project_intro_content,
  parent: project_intro_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

project_spec_content = [
  ['text', 'You are given two datasets:'],
  ['text', 'The Abandoned Caller Dataset: Almost half of potential customers who inquire via “Martin’s Travel Agency” call center “abandon the call.” This call center log includes all of the “abandoned” callers from May 1st to May 31st.'],
  ['text', 'The Reservation Dataset: A list of the reservations created from May 1st to May 31st for vacation spaces with “Martin’s Travel Agency” which include both abandoned callers who re-engaged with their purchase and otherwise.'],
  ['text', 'Remember your task is to determine the effectiveness of MightyHive\'s advertising campaign for their client "Martin\'s Travel Agency"'],
]

project_spec_content_two = [
  ['text', 'You can download the Abandoned Caller Dataset here:'],
  ['link', 'www.abandonedcallerdataset.com'],
  ['text', 'You can download the Reservation Dataset here:'],
  ['link', 'www.addlinkhere.com']
]


project_spec_step = Step.create!(
  title: "Data",
  lesson: project_intro_lesson
)

project_spec_slide = Slide.create!(
  content: project_spec_content,
  parent: project_spec_step
)

project_spec_slide_two = Slide.create!(
  content: project_spec_content_two,
  parent: project_spec_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


project_experiment_content = [
  ['text', 'MightyHive randomly split the "abandoned" callers into test/control buckets.'],
  ['text', 'The test group was shown ads online via MightyHive for a period of 7 days.'],
  ['text', 'The control group was never shown ads'],
  ['text', 'After cleaning the data and conversions we will perform a test of two proportions statistical analysis to determine whether the proportion of converted users in the test bucket is statistically significant.']
]

project_experiment_step = Step.create!(
  title: "The Advertising Experiment",
  lesson: project_intro_lesson
)

project_spec_slide = Slide.create!(
  content: project_experiment_content,
  parent: project_experiment_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

project_initial_content = [
  ['text', 'The first thing to do with any data set is to understand the rows and columns. Take a look first yourself at what each row represents.'],
  ['text', 'From looking at the data we can see that there are several columns which are not necessary for us to deal with. Removing them simplifies the dataset we are working with.'],
  ['text', 'Because we only use phone number and email to match the users from the abandoned dataset to the reservation dataset we can remove most other columns'],
  ['text', 'Here we create a new data frame which includes only the columns that we want to work with for our analysis:'],
  ['code', 'abndData <- as.data.frame(cbind(raw_abandoned_data$Session, raw_abandoned_data$Last_Name, raw_abandoned_data$Email,
                                raw_abandoned_data$Incoming_Phone, raw_abandoned_data$Contact_Phone, raw_abandoned_data$Test_Control),
                          stringsAsFactors = F)'],
  ['text', 'We also label the columns'],
  ['code', 'colnames(abndData) <- c("SESSION_A", "LAST_NAME_A", "EMAIL_A", "INCOMING_PHONE_A", "CONTACT_PHONE_A", "TEST_CONTROL_A")'],
]

project_initial_content_two = [
  ['text', 'And we do the same for the reservation dataset'],
  ['code', 'resData <- as.data.frame(cbind(raw_reservation_data$Session, raw_reservation_data$Last_Name, raw_reservation_data$Email,
                                raw_reservation_data$Incoming_Phone, raw_reservation_data$Contact_Phone, raw_reservation_data$Test_Control),
                          stringsAsFactors = F)'],
  ['code', 'colnames(resData) <- c("SESSION_R", "LAST_NAME_R", "EMAIL_R", "INCOMING_PHONE_R", "CONTACT_PHONE_R", "TEST_CONTROL_R")'],
]

project_initial_format_lesson = Lesson.create!(
  title: "Data Formatting",
  project: project
)

project_initial_format_slide_one = Slide.create!(
  content: project_initial_content,
  parent: project_initial_format_lesson
)

project_initial_format_slide_two = Slide.create!(
  content: project_initial_content_two,
  parent: project_initial_format_lesson

)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


cleaning_lesson = Lesson.create!(
  title: "Data Cleaning",
  project: project
)

regex_cleaning = Step.create!(
  title: "Removing Bad Data",
  lesson: cleaning_lesson
)

data_dedup_cleaning = Step.create!(
  title: "Data De-duplication",
  lesson: cleaning_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

matching_lesson = Lesson.create!(
  title: "Data Matching",
  project: project
)

email_matching = Step.create!(
  title: "Email Matching",
  lesson: matching_lesson
)

phone_contact_matching = Step.create!(
  title: "Phone Contact Matching",
  lesson: matching_lesson
)

incoming_phone_matching = Step.create!(
  title: "Incoming Phone Matching",
  lesson: matching_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

analysis_lesson = Lesson.create!(
  title: "Data Analysis",
  project: project
)

hypothesis_test = Step.create!(
  title: "Hypothesis Test",
  lesson: analysis_lesson
)

two_sample_test = Step.create!(
  title: "Test of Two Proportions",
  lesson: analysis_lesson
)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  project: project
)


