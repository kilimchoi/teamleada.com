# Main Page

main_page_content = [
  ['text','MightyHive is an advertising technology company that uses retargeting methods to send ads to users online. One product, “Call Center Remarketing”, uses call center logs to show online advertisements to consumers who have recently called into a clients call center.'],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
  ['text', 'Start at the Project Overview section. Follow downwards by clicking on lessons on the left sidebar.'],
]

project = Project.create!(
  title:"MightyHive",
  description: main_page_content,
  short_description: "A data project sponsored by Mightyhive, an advertising technology company. This data is based on a real problem that the analytics team at MightyHive encountered. You will perform data cleaning, de-duplication, and statistical analysis to determine the results of their marketing technology.",
  number: 4,
  enabled: false,
  paid: true,
  cost: 500,
  uid: 4,
  difficulty: 'Advanced',
  category: Project::LESSON,
  is_new: false,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################


project_overview_content = [
  ['text', 'This data project is based off of work that was directly done by the analytics team at MightyHive.'],
  ['text', 'We will first begin by describing the data you will be working with and the context of the problem MightyHive was facing.'],
  ['lesson_links', nil]
]


project_overview_lesson = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

project_overview_slide = Slide.create!(
  content: project_overview_content,
  parent: project_overview_lesson,
  slide_id: 0,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

project_spec_content = [
  ['text', '"The Abandoned Caller Dataset":'],
  ['text', 'Almost half of potential customers who inquire via “Martin’s Travel Agency” call center “abandon the call.” This call center log includes all of the “abandoned” callers from May 1st to May 31st.'],
  ['text', '"The Reservation Dataset":'],
  ['text', 'A list of the reservations created from early 2014 for vacation spaces with “Martin’s Travel Agency” which includes both abandoned callers who re-engaged with their purchase and otherwise.'],
  ['text', 'Using these two datasets you will determine whether the online ads MightyHive sent to "Martin\'s Travel Agency" customers had an effect on converting "abandoned" callers to make a reservation.'],
]

project_spec_content_two = [
  ['text', 'A key for the datasets is provided below:'],
  ['text', '"Caller_ID" - A unique ID given to each incoming phone call to the call center.'],
  ['text', '"Session" - The Year/Month/Day/Time of each incoming phone call to the call center.'],
  ['text', '"First_Name" - First name of caller'],
  ['text', '"Last_Name" - Last name of caller'],
  ['text', '"Street" - Street Address of caller'],
  ['text', '"City" - City location of caller'],
  ['text', '"State" - State location of caller'],
  ['text', '"Zipcode" - Zipcode of caller'],
  ['text', '"E-mail" - E-mail of caller'],
  ['text', '"Incoming_Phone" - Incoming phone number from caller identified using caller identification'],
  ['text', '"Contact_Phone" - Phone number the caller submits'],
  ['text', '"Test_Control" - Test/Control identification'],
]

project_spec_content_three = [
  ['text', 'Download the Abandoned dataset and save it as "Abandoned_Data_Seed" in the appropriate working directory.'],
  ['link', 'https://s3.amazonaws.com/leada/mh_data/Reservation_Data_Seed.csv'],
  ['text', 'Download the Reservation dataset and save it as "Reservation_Data_Seed" in the appropriate working directory.'],
  ['link', 'https://s3.amazonaws.com/leada/mh_data/Abandoned_Data_Seed.csv'],
  ['text', 'First open up these two datasets in Excel to take look at the data.'],
  ['next_steps', nil]
]


project_spec_step = Step.create!(
  title: "Data",
  lesson: project_overview_lesson,
  step_id: 0,
)

project_spec_slide = Slide.create!(
  content: project_spec_content,
  parent: project_spec_step,
  slide_id: 0,
)

project_spec_slide_two = Slide.create!(
  content: project_spec_content_two,
  parent: project_spec_step,
  slide_id: 1,
)

project_spec_slide_three = Slide.create!(
  content: project_spec_content_three,
  parent: project_spec_step,
  slide_id: 2,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


project_experiment_content = [
  ['text', 'MightyHive randomly split the "abandoned" callers into test/control buckets.'],
  ['text', 'The test group was shown ads online for a period of 7 days.'],
  ['text', 'The control group was never shown any ad.'],
  ['text', 'Given this experiment setting, take a momement to think about how you would use these datasets to determine the results MightyHive requires.'],
  ['next_steps', nil]
]

project_experiment_step = Step.create!(
  title: "Experiment Details",
  lesson: project_overview_lesson,
  step_id: 1,
)

project_spec_slide = Slide.create!(
  content: project_experiment_content,
  parent: project_experiment_step,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

analysis_strategy_content = [
  ['text', 'The first step is to look at the data in both datasets and formulate a strategy for tackling the problem at hand.'],
  ['text', 'How do we know whether an "abandoned" caller eventually made a reservation?'],
  ['text', 'The simple answer is that any observation which is included from both the abandoned and reservation datasets would be a considered conversion.'],
  ['text', 'What then determines a match for observations?'],
  ['text', 'Is relying solely on the first and last name enough?'],
  ['text', 'Looking at the data there is also quite a large number of missing values. If you exmaine close enough, there are also several observations which have the last name "WebTest" and shouldn\'t be considered in our analysis.'],
]

analysis_strategy_content_two = [
  ['text', 'There are enough unknowns in this dataset to make a "correct" answer impossible.'],
  ['text', 'However we will go through one possible solution which includes major processes of how this was handled at MightyHive.'],
  ['text', 'The first step is data matching abandoned observations with reservation observations.'],
  ['text', 'We do this first to determine the total possible number of conversions for both the test and control groups.'],
  ['text', 'The second step is to clean the data; we\'ll filter the resulting possible conversions to only the ones which are plausible.'],
  ['text', 'The final step is in the actual analysis where we define our hypothesis test and perform statistical analysis.'],
  ['next_steps', nil]
]

analysis_strategy_lesson = Lesson.create!(
  title: "Analysis Strategy",
  project: project,
  lesson_id: 1,
)

analysis_strategy_slide_one = Slide.create!(
  content: analysis_strategy_content,
  parent: analysis_strategy_lesson,
  slide_id: 0,
)

analysis_strategy_slide_two = Slide.create!(
  content: analysis_strategy_content_two,
  parent: analysis_strategy_lesson,
  slide_id: 1,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_matching_lesson_content = [
  ['text', 'In the perfect scenario, we could match each reservation observation exactly with the resulting reservation observation if it exists.'],
  ['text', 'However the reality of the situation is that call center workers sometimes make clerical errors.'],
  ['text', 'For our analysis, we\'ll define "matched data" as any observation with a match in the Incoming_Phone column between the Abandoned Dataset and the Reservations Dataset'],
  ['text', 'This stems from the reasonable assumption that customer phone numbers are unique.'],
  ['lesson_links', nil]
]


data_matching_lesson = Lesson.create!(
  title: "Data Matching",
  project: project,
  lesson_id: 2,
)

data_matching_slide = Slide.create!(
  content: data_matching_lesson_content,
  parent: data_matching_lesson,
  slide_id: 0,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

initial_setup_step_content = [
  ['text', 'Let\'s now load our data into RStudio.'],
  ['text', 'Because we are missing a lot of data, we set the parameter na.strings = "" in the read.csv() function. This way any blank values are set to NA. This will make it easier to see which values in our dataset are missing.'],
  ['code', 'raw_abandoned_data <- read.csv("Abandoned_Data_Seed.csv", head = T, na.strings = "", stringsAsFactors = F)'],
  ['code', 'raw_reservation_data <- read.csv("Reservation_Data_Seed.csv", head = T, na.strings = "", stringsAsFactors = F)'],
  ['text', 'Since we only want to check for matches in Incoming_Phone, we can remove many of the columns which are unnecssary for our analysis.'],
  ['text', 'We also want to make sure to include the last name column to filter out the "WebTest" observations.']
]

initial_setup_step_content_two = [
  ['text', 'To create this simplified dataset, use the cbind() function which concatenates entire columns in R.'],
  ['code', 'help(cbind) #if you\'re curious about cbind().'],
  ['text', 'In the below code snippet, we\'re manually selecting columns via the "$" operator.'],
  ['text', 'We then recombine the selected columns via cbind(), and then reconvert it back to a new dataframe via as.data.frame().'],
  ['code', 'abndData <- as.data.frame(cbind(raw_abandoned_data$Session, raw_abandoned_data$Last_Name, raw_abandoned_data$Email, raw_abandoned_data$Incoming_Phone, raw_abandoned_data$Contact_Phone, raw_abandoned_data$Test_Control), stringsAsFactors = F)'],
  ['text', 'Next we re-label the columns.'],
  ['code', 'colnames(abndData) = c("SESSION_A", "LAST_NAME_A", "EMAIL_A", "INCOMING_PHONE_A", "CONTACT_PHONE_A", "TEST_CONTROL_A")'],
]

initial_setup_step_content_three = [
  ['text', 'We do the same for the reservation dataset'],
  ['code', 'resData <- as.data.frame(cbind(raw_reservation_data$Session, raw_reservation_data$Last_Name, raw_reservation_data$Email, raw_reservation_data$Incoming_Phone, raw_reservation_data$Contact_Phone, raw_reservation_data$Test_Control), stringsAsFactors = F)'],
  ['code', 'colnames(resData) <- c("SESSION_R", "LAST_NAME_R", "EMAIL_R", "INCOMING_PHONE_R", "CONTACT_PHONE_R", "TEST_CONTROL_R")'],
  ['text', 'Because the reservation dataset ultimately stores all conversions, we will add a column to the new reservation dataset (resData).'],
  ['text', 'The added column will identify whether there was a corresponding match in the abandoned dataset.'],
  ['text', 'We add the column below.'],
  ['code', 'resData$CONV = 0'],
  ['text', 'We actually assigned the entire column to be 0s. We will later re-label them to be 1s if there is a conversion.'],
  ['next_steps', nil]
]

initial_setup_step = Step.create!(
  title: "Initial Setup",
  lesson: data_matching_lesson,
  step_id: 0,
)

initial_setup_slide_one = Slide.create!(
  content: initial_setup_step_content,
  parent: initial_setup_step,
  slide_id: 0,
)

initial_setup_slide_two = Slide.create!(
  content: initial_setup_step_content_two,
  parent: initial_setup_step,
  slide_id: 1,
)

initial_setup_slide_three = Slide.create!(
  content: initial_setup_step_content_three,
  parent: initial_setup_step,
  slide_id: 2,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

matching_step_content = [
  ['text', 'Now we can add an additional column which will identify whether a match occured between the abandoned and reservation datasets via the phone number column.'],
  ['code', 'resData$INCOMING_PHONE_MATCH <- 0'],
  ['text', 'The next step is to determine when there is a data match. Lets first take a look at our data.'],
  ['code', 'abndData$INCOMING_PHONE_A'],
  ['text', 'Scrolling through this data, you\'ll notice two things:'],
  ['text', 'First, there are tons of NA values'],
  ['text', 'Second, each value that isn\'t NA is in quotations which tells us that it\'s currently stored as characters class.'],
  ['text', 'Check this by indexing the first element in the Incoming_Phone column with the code below'],
  ['code', 'class(abndData$INCOMING_PHONE_A[1])'],
]

matching_step_content_two = [
  ['text', 'For each incoming phone observation that is not NA, we want to check to see if there is a matching observation in the reservation data in either the Incoming_Phone column or the Contact_Phone column.'],
  ['text', 'We use the which() function in R to find the matches.'],
  ['code', 'which(abndData$INCOMING_PHONE_A[88] == resData$INCOMING_PHONE_R)'],
  ['text', 'For example this returns the rows in the Incoming_Phone column of the Reservation dataset which the 88th phone number in the Incoming_Phone column of the Abandoned dataset matches.'],
  ['text', 'Verify for this on your own by manually checking the index.'],
  ['code', 'abndData$INCOMING_PHONE_A[88]'],
  ['code', 'resData$INCOMING_PHONE_R[16685]'],
  ['quiz', 'mh_1' ],
]

matching_step_content_three = [
  ['text', 'Lets now save those matched rows into the variable "phone_match".'],
  ['text', 'Also for each appropriate row in the Incoming_Phone column of the Reservation dataset, lets assign a 1 to the Incoming_Phone_Match column we created earlier.'],
  ['text', 'We create the variable phone_match because there could be more than 1 match!'],
  ['code', 'phone_match = which(abndData$INCOMING_PHONE_A[88] == resData$INCOMING_PHONE_R)'],
  ['code', 'for(i in phone_match) {'],
  ['code', '  resData$INCOMING_PHONE_MATCH[i] <- 1'],
  ['code', '}'],
]

matching_step_content_four = [
  ['text', 'We have now correctly matched phone numbers from the abandoned dataset to the reservation dataset. To make sure our experiment is correct, we need to also verify that these matches are for the same Test/Control group.'],
  ['text', 'A match for phone numbers in a test group and a control group most likely implies that there are two different users submitting the same phone number. This was actually quite possible in the case of two people working for a single business.'],
  ['text', 'Regardless these conversions cannot be counted.'],
  ['text', 'We can add a simple check for this using logical comparisons. Lets make sure the match we found earlier is in the same experiment group.'],
  ['code', 'if(abndData$TEST_CONTROL_A[88] != resData$TEST_CONTROL_R[16685]) {'],
  ['code', '  print("Different test groups! Cannot use this match!")'],
  ['code', '  resData$INCOMING_PHONE_MATCH[j] <- 0'],
  ['code', '} else {'],
  ['code', '  print("Same test group, keep the match!")'],
  ['code', '}'],
]

matching_step_content_five = [
  ['text', 'The tricky part is that this comparison needs to be carefuly placed. Lets now write the code which will check for matches and verify the correct control/test group for the entire abandoned dataset.'],
  ['code', 'for(i in c(1:nrow(abndData))) {'],
  ['code', '  phone_match = which(abndData$INCOMING_PHONE_A[i] == resData$INCOMING_PHONE_R)'],
  ['code', '  for(j in phone_match) {'],
  ['code', '    resData$INCOMING_PHONE_MATCH[j] <- 1'],
  ['code', '    if(abndData$TEST_CONTROL_A[i] != resData$TEST_CONTROL_R[j]) {'],
  ['code', '      resData$INCOMING_PHONE_MATCH[j] <- 0'],
  ['code', '    }'],
  ['code', '  }'],
  ['code', '}'],
]

matching_step_content_six = [
  ['text', 'Lets add a check for skipping NA values. This is done in the first if statement and the use of "next" which tells R to exit out of the loop and continue to the next step.'],
  ['code', 'for(i in c(1:nrow(abndData))) {'],
  ['code', '  if(is.na(abndData$INCOMING_PHONE_A[i])) {'],
  ['code', '    next'],
  ['code', '  }'],
  ['code', '  phone_match = which(abndData$INCOMING_PHONE_A[i] == resData$INCOMING_PHONE_R)'],
  ['code', '  for(j in phone_match) {'],
  ['code', '    resData$INCOMING_PHONE_MATCH[j] <- 1'],
  ['code', '    if(abndData$TEST_CONTROL_A[i] != resData$TEST_CONTROL_R[j]) {'],
  ['code', '      resData$INCOMING_PHONE_MATCH[j] <- 0'],
  ['code', '    }'],
  ['code', '  }'],
  ['code', '}'],
]

matching_step_content_seven = [
  ['text', 'We write another for loop for checking matches between Incoming_Phone and Contact_Phone columns.'],
  ['code', 'for(i in c(1:nrow(abndData))) {'],
  ['code', '  if(is.na(abndData$INCOMING_PHONE_A[i])) {'],
  ['code', '    next'],
  ['code', '  }'],
  ['code', '  phone_match_two = which(abndData$INCOMING_PHONE_A[i] == resData$CONTACT_PHONE_R)'],
  ['code', '  for(k in phone_match_two) {'],
  ['code', '    resData$INCOMING_PHONE_MATCH[k] <- 1'],
  ['code', '    if(abndData$TEST_CONTROL_A[i] != resData$TEST_CONTROL_R[k]) {'],
  ['code', '      resData$INCOMING_PHONE_MATCH[k] <- 0'],
  ['code', '    }'],
  ['code', '  }'],
  ['code', '}'],
]

matching_step_content_eight = [
  ['text', 'In our CONV column we can now add a 1 if there is a 1 in the Incoming_Phone_Match column. In our case the CONV column will be the exact same as the Incoming_Phone_Match column.'],
  ['code', 'for(i in c(1:nrow(resData))) {'],
  ['code', '  if(resData$INCOMING_PHONE_MATCH[i] == 1) {'],
  ['code', '    resData$CONV[i] <- 1'],
  ['code', '  }'],
  ['code', '}'],
  ['next_steps', nil]
]


matching_step = Step.create!(
  title: "Matching Code",
  lesson: data_matching_lesson,
  step_id: 1,
)

matching_slide_one = Slide.create!(
  content: matching_step_content,
  parent: matching_step,
  slide_id: 0,
)


matching_slide_two = Slide.create!(
  content: matching_step_content_two,
  parent: matching_step,
  slide_id: 1,
)


matching_slide_three = Slide.create!(
  content: matching_step_content_three,
  parent: matching_step,
  slide_id: 2,
)


matching_slide_four = Slide.create!(
  content: matching_step_content_four,
  parent: matching_step,
  slide_id: 3,
)


matching_slide_five = Slide.create!(
  content: matching_step_content_five,
  parent: matching_step,
  slide_id: 4,
)


matching_slide_six = Slide.create!(
  content: matching_step_content_six,
  parent: matching_step,
  slide_id: 5,
)


matching_slide_seven = Slide.create!(
  content: matching_step_content_seven,
  parent: matching_step,
  slide_id: 6,
)

matching_slide_eight = Slide.create!(
  content: matching_step_content_eight,
  parent: matching_step,
  slide_id: 7,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "mh_1",
  answer:"(402)-153-4684",
  project: project,
  slide: matching_slide_two,
  question: 'What is the phone number that is matched? Make sure to input it in exactly the same format!',
)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_cleaning_content = [
  ['text','Now that we have flagged each of the potential conversions we need to filter out the conversions which should not be included in our analysis. Two types of observations in particular need to be removed.'],
  ['text','First, any observation which has the last name "WebTest" needs to be removed because those are observations that are internal to the travel agency\'s technology team.'],
  ['text','Second, if you noticed when we calculated the phone matching there were observations which matched with multiple rows in the reservation dataset. Brainstorm for yourself a second why this could be the case.'],
]

data_cleaning_content_two = [
  ['text', 'Keeping in mind for the client "Martin\'s Travel Agency", we assume that reservations under the same number are a result multiple bookings for vacations.'],
  ['text', 'Verification with the client proves this to be a relatively common occurence. Since we do not want to artificially inflate our conversion numbers we must de-duplicate these conversions into single ones.'],
  ['text', 'Luckily duplicate conversions are contained within the test/control groups so we do not have to do additional filtering besides de-duplication.'],
  ['lesson_links', nil],
]

data_cleaning_lesson = Lesson.create!(
  title: "Data Cleaning",
  project: project,
  lesson_id: 3,
)

data_cleaning_slide = Slide.create!(
  content: data_cleaning_content,
  parent: data_cleaning_lesson,
  slide_id: 0,
)

data_cleaning_slide_two = Slide.create!(
  content: data_cleaning_content_two,
  parent: data_cleaning_lesson,
  slide_id: 1,
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

remove_webtest_content = [
  ['text', 'We will first remove all of the observations in the reservation dataset which have the last name "WebTest". These are clearly test users which the client uses for their internal work.'],
  ['text', 'This can be easily done, but it requires the understanding of a new concept, regular expressions.'],
  ['text', 'Regular expressions is a language theory for programmers that forms a search pattern for matching strings.'],
  ['text', 'In our case, we want to identify all of the rows which have the last name "WebTest". Using the grep() function in R, we can use a regular expression pattern to search through a specified dataset. This will return the rows which contain that regular expression.'],
]

remove_webtest_content_two = [
  ['text', 'Our regular expression is quite simple since the pattern we want to find is an exact character set.'],
  ['code', 'webtest_index <- grep("WebTest",resData$LAST_NAME_R)'],
  ['text', 'webtest_index now contains all of the rows in resData which have "WebTest" as the last name.'],
  ['text', 'This was relatively straightforward, but regular expressions can get quite complicated when you want to generalize it to a group of characters.'],
  ['text', 'For example, here is the regular expression for finding all of the emails in resData which are from Gmail.'],
  ['code', 'gmail_index <- grep(".+@gmail.com", resData$EMAIL_R)'],
]

remove_webtest_content_three = [
  ['text','The "." signals any single character and "+" signals that the preceeding item occurs one or more times. Consequently this regular expression looks for the following pattern:'],
  ['text', 'Any character to occur one or more times and then @gmail.com follows.'],
  ['text', 'With the webtest_index, we can remove these rows in our resData to remove the WebTest last names.'],
  ['code', 'resData <- resData[-c(webtest_index), ]'],
  ['next_steps', nil],
]

remove_webtest_step = Step.create!(
  title: "Removing WebTest",
  lesson: data_cleaning_lesson,
  step_id: 0,
)

remove_webtest_slide = Slide.create!(
  content: remove_webtest_content,
  parent: remove_webtest_step,
  slide_id: 0,
)

remove_webtest_slide_two = Slide.create!(
  content: remove_webtest_content_two,
  parent: remove_webtest_step,
  slide_id: 1,
)
remove_webtest_slide_three = Slide.create!(
  content: remove_webtest_content_three,
  parent: remove_webtest_step,
  slide_id: 2,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_dedup_content = [
  ['text', 'The next stage in the data cleaning process is de-duplicating multiple reservations. Since we only care about de-duplicating the conversions in the reservation dataset we can create a data frame which only includes converted reservations.'],
  ['code', 'conversion_data <- resData[which(resData$CONV == 1), ]'],
  ['text', 'We create a vector to store the rows which are duplicates and need to be removed.'],
  ['code', 'rows_to_remove <- vector()'],
]

data_dedup_content_two = [
  ['text', 'To determine the duplicate rows we again utilize the which() function. We save the duplicate rows into a vector and continuously save that changing vector in our rows_to_remove vector as long as there exists a duplicate.'],
  ['code', 'for(i in 1:nrow(conversion_data)) {'],
  ['code', '  duplicate_rows = which(conversion_data$INCOMING_PHONE_R[i] == conversion_data$INCOMING_PHONE_R)'],
  ['code', '  if(length(duplicate_rows) >= 2) {'],
  ['code', '    rows_to_remove <- c(rows_to_remove, duplicate_rows)'],
  ['code', '  }'],
  ['code', '}'],
]

data_dedup_content_three = [
  ['text', 'We utilize the unique() function to keep only unique rows in our rows_to_remove vector.'],
  ['code', 'rows_to_remove <- unique(rows_to_remove)'],
  ['text', 'We remove these rows by negatively indexing.'],
  ['code', 'cleaned_conversion_data <- conversion_data[-c(rows_to_remove), ]'],
  ['text', 'And now we have a dataset which only includes conversions which can be attributed to the advertising experiment.'],
  ['next_steps', nil],
]

data_dedup_step = Step.create!(
  title: "Data De-duplication",
  lesson: data_cleaning_lesson,
  step_id: 1,
)

data_dedup_slide = Slide.create!(
  content: data_dedup_content,
  parent: data_dedup_step,
  slide_id: 0,
)

data_dedup_slide_two = Slide.create!(
  content: data_dedup_content_two,
  parent: data_dedup_step,
  slide_id: 1,
)

data_dedup_slide_three = Slide.create!(
  content: data_dedup_content_three,
  parent: data_dedup_step,
  slide_id: 2,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

stat_content_one = [
  ['text', 'Determining the appropriate statistical test can be a challenge, here we will explain how to use the most common statistical test, the z-test, and also explain why it is appropriate for this data.'],
  ['text', 'The first thing to do is to take a look at exactly the data we are performing a statistical test on.'],
  ['text', 'While this data comes from the two datasets we started with, its easier to understand which statistical test to apply when you look at the cleaned data.'],
  ['text', 'We have two groups, test and control.'],
  ['text', 'Within each group, we have 1\'s and 0\'s.'],
  ['text', 'Every 1 is defined as a conversion and 0s are defined as a non-conversion.'],
]

stat_content_two = [
 ['text', 'Notice that the proportion of the test and control groups is the same as calculating the average of the two groups.'],
 ['text', 'Therefore we want a statistical test that compares the averages between two groups.'],
 ['text', 'Comparing the averages of two groups implies using either a t-test or a z-test and since we have a fairly large sample size we can use the z-test.'],
 ['lesson_links', nil],
]

stat_lesson = Lesson.create!(
  title: "Statistical Analysis",
  project: project,
  lesson_id: 4,
)

stat_slide_one = Slide.create!(
  content: stat_content_one,
  parent: stat_lesson,
  slide_id: 0,
)

stat_slide_two = Slide.create!(
  content: stat_content_two,
  parent: stat_lesson,
  slide_id: 1,
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

hypothesis_content = [
  ['text', 'In any experiment you must first define your null hypothesis. The null hypothesis in experiments is usually that there is no observed effect from the treatment between the test and control groups. '],
  ['text', 'In our case that would mean that the proportion of conversion for the test group is equal to the proportion of the conversion for our control group and the online advertisements MightyHive used had no effect.'],
  ['text', 'Our alternative hypothesis is that there is an effect, specifically the proprtion of the conversion for our test group is GREATER THAN the proportion of conversion in our control group.'],
]

hypothesis_content_two = [
  ['text', 'Lets first calculate these proportions'],
  ['code', 'test_success = length(cleaned_conversion_data$TEST_CONTROL_R[which(cleaned_conversion_data$TEST_CONTROL_R == "test")])'],
  ['code', 'test_total = sum(abndData$TEST_CONTROL_A == "test")'],
  ['code', 'test_proportion = test_success/test_total'],
  ['quiz', 'mh_2'],
  ['quiz', 'mh_3'],
]

hypothesis_content_three = [
  ['text', 'Lets now calculate the same for the control group.'],
  ['code', 'control_success = length(cleaned_conversion_data$TEST_CONTROL_R[which(cleaned_conversion_data$TEST_CONTROL_R == "control")])'],
  ['code', 'control_total = sum(abndData$TEST_CONTROL_A == "control")'],
  ['code', 'control_proportion = control_success/control_total'],
  ['text', 'Now we know how many people in control group had successfully converted!'],
  ['next_steps', nil],
]

hypothesis_step = Step.create!(
  title: "Hypothesis Test",
  lesson: stat_lesson,
  step_id: 0,
)

hypothesis_slide = Slide.create!(
  content: hypothesis_content,
  parent: hypothesis_step,
  slide_id: 0,
)

hypothesis_slide_two = Slide.create!(
  content: hypothesis_content_two,
  parent: hypothesis_step,
  slide_id: 1,
)

hypothesis_slide_three = Slide.create!(
  content: hypothesis_content_three,
  parent: hypothesis_step,
  slide_id: 2,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "mh_2",
  answer:"245",
  project: project,
  slide: hypothesis_slide_two,
  question: 'What was the number of test conversions?',
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "mh_3",
  answer:"4266",
  project: project,
  slide: hypothesis_slide_three,
  question: 'What was the total sample size of the test group?',
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

z_test_content = [
  ['text', 'The statistical test we will perform is the two sample z-test for the difference between two proportions. To use this test the following conditions must apply:'],
  ['text', '1. The two samples must be independent'],
  ['text', '2. The sample sizes must be large enough for the normal distribution to apply'],
  ['text', '3. The samples must be randomly selected'],
  ['text', 'For the two samples to be indpendent their probabilities for conversion must not have an effect on each other. Definitionally P(A & B) = P(A) * P(B). '],
  ['text', 'This is actually quite difficult to prove, but we can assume that the use of control/test groups makes these samples mostly independent of each other. '],
  ['text', 'There is also an exception for the z-test in which it can be applied in the case of a randomized controlled experiment and the groups are dependent.'],
]

z_test_content_two = [
  ['text', 'A sample size larger than 25 is generally big enough but this is relative to the distribution of the population you are sampling from. If the distribution of your population is very skewed you need a larger sample size for the normal distribution to apply.'],
  ['text', 'The first step is to calculate our test statistic which is the difference between the test proportion and the control proportion. '],
  ['code', 'test_statistic = test_proportion - control_proportion'],
  ['text', 'Next we need to calculate how large or small our test statistic will be due to chance. This difference due to chance is called the standard error. We have the following formula to calculate the standard error for the difference between two proportions.'],
  ['code', 'SE = sqrt((test_proportion*(1 - test_proportion)/test_total) + (control_proportion*(1-control_proportion)/control_total))']
]

z_test_content_three = [
  ['text', 'We can now determine how extreme the occurence of this test statistic was based on the normal distribution. This test statistic when divded by the standard error becomes the well known z-score. '],
  ['text', 'The z-score basically says, how many SDs away our observed test statistic is from what we would expect and what we expect is the null hypothesis, that the difference between the two proportions is zero.'],
  ['code', 'z_score <- (test_proportion - control_proportion) / SE'],
  ['quiz', 'mh_4'],
]

z_test_content_four = [
  ['text', 'We now use the normal distribution to determine what is the probability of getting a z-score more extreme than the one we observed. Since our test statistic is positive we want to look at the right tail of the normal distribution as defined by where our z-score is on the normal curve.'],
  ['image', 'z_score_graphic.png'],
]

z_test_content_five = [
  ['image', 'z_score_graphic.png'],
  ['text', 'The area under the curve to the right of the z-score is the chance of getting a test statistic as extreme as, or more extreme than, what we observed, given that the null hypothesis is true. '],

]

z_test_content_six = [
  ['text', 'Therefore since this chance is really small (the area in red) we have a strong case against the null hypothesis and can conclude our alternative to be statistically significant.'],
  ['text', 'To calculate the area under the normal curve to the right of our z-score we use the pnorm() function in R.'],
  ['code', 'pnorm(z_score, lower.tail = F)'],
  ['text', 'This value is known as the P-value. The P-value is the chance of getting a more extreme test statistic assuming that the null hypothesis is right. '],
  ['text', 'Generally a p-value below 5% is considered statistically significant for research.']
]

z_test_content_seven = [
  ['text', 'Therefore if this chance is really small, we can reject the null hypothesis and when this chance is high, or in most cases greater than 5% we conclude that there is a high enough chance of  getting a more extreme test statistic due to chance so we fail to reject the null hypothesis.'],
  ['text', 'For reference there is a very clear explanation of using the z-test for the difference between two proprtions and the formulas we used at the link below:'],
  ['link', 'http://math.mercyhurst.edu/~griff/courses/m109/Lectures/sect8.4.pdf'],
]

z_test_content_eight = [
  ['text', 'R also has a function to perform this statistical test. The first argument is a vector of the counts of successes and the second argument is a vector of counts of total trials.'],
  ['code', 'prop.test(c(test_success,control_success),c(test_total,control_total))'],
  ['text', 'We can also calculate the 95% confidence intervals for our test statistic. This represents the range we are 95% confident the difference between the two proportions lie.'],
  ['code', 'upper_bound <- test_proportion - control_proportion + 1.96*SE'],
  ['code', 'lower_bound <- test_proportion - control_proportion - 1.96*SE'],
  ['text', '1.96 is the z-score which defines 95% of the area under the normal curve.'],
  ['text', 'Note that this 95% confidence interval values are approximately the same as values in the 95% confidence interval output in the prop.test() function.'],
  ['next_steps', nil],
]

z_test_step = Step.create!(
  title: "Two Sample Z-Test",
  lesson: stat_lesson,
  step_id: 1,
)

z_test_slide = Slide.create!(
  content: z_test_content,
  parent: z_test_step,
  slide_id: 0,
)

z_test_slide_two = Slide.create!(
  content: z_test_content_two,
  parent: z_test_step,
  slide_id: 1,
)

z_test_slide_three = Slide.create!(
  content: z_test_content_three,
  parent: z_test_step,
  slide_id: 2,
)

z_test_slide_four = Slide.create!(
  content: z_test_content_four,
  parent: z_test_step,
  slide_id: 3,
)

z_test_slide_five = Slide.create!(
  content: z_test_content_five,
  parent: z_test_step,
  slide_id: 4,
)

z_test_slide_six = Slide.create!(
  content: z_test_content_six,
  parent: z_test_step,
  slide_id: 5,
)

z_test_slide_seven = Slide.create!(
  content: z_test_content_seven,
  parent: z_test_step,
  slide_id: 6,
)

z_test_slide_eight = Slide.create!(
  content: z_test_content_eight,
  parent: z_test_step,
  slide_id: 7,
)

quiz = ExactAnswerQuiz.create!(
  quiz_id: "mh_4",
  answer:"10.2",
  project: project,
  slide: z_test_slide_three,
  question: 'What is our Z score rounded to the tens digit?',
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

conclusion_content = [
  ['text', 'In conclusion we find that the effect of the MightyHive advertising campaign to be statistically significant in this experiment.'],
  ['text', 'Our 95% confidence interval shows the lift in conversions because of MightyHive advertising technology to be between 3.3% and 4.9%.'],
  #['feedback', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
  #['project_link', 'Back to the Project main page'],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

conclusion_lesson = Lesson.create!(
  title: "MH Conclusion",
  project: project,
  lesson_id: 5,
)


conclusion_slide = Slide.create!(
  content: conclusion_content,
  parent: conclusion_lesson,
  slide_id: 0,
)
