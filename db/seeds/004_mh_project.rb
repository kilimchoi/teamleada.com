
# Main Page

main_page_content = [
  ['text','MightyHive is an advertising technology company that uses retargeting methods to send ads to users online. One product, “Call Center Remarketing”, uses call center logs to show online advertisements to consumers who have recently called into a clients call center.'],
  ['text', 'You are tasked with determining the effectiveness of one of their advertising campaigns with a vacation rental client “Martin’s Travel Agency”.'],
]

project = Project.create!(
  title:"MightyHive",
  description: main_page_content,
  short_description: "A data project sponsored by Mightyhive, an advertising technology company. This data is based on a real problem that the analytics team at MightyHive encountered. You will perform data cleaning, de-duplication, and statistical analysis to determine the results of their marketing technology."
  number: 5,
  enabled: true
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################


project_overview_content = [
  ['text', 'This project is based off of work that was directly done by the analytics team at MightyHive.'],
  ['text', 'We will first begin by describing the data you will be working with and the context of the problem MightyHive was facing'],
  ['lesson_links', nil]
]


project_overview_lesson = Lesson.create!(
  title: "Project Overview",
  project: project
)

project_overview_slide = Slide.create!(
  content: project_overview_content,
  parent: project_overview_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

project_spec_content = [
  ['text', 'You are given two datasets:'],
  ['text', 'The Abandoned Caller Dataset: Almost half of potential customers who inquire via “Martin’s Travel Agency” call center “abandon the call.” This call center log includes all of the “abandoned” callers from May 1st to May 31st.'],
  ['text', 'The Reservation Dataset: A list of the reservations created from May 1st to May 31st for vacation spaces with “Martin’s Travel Agency” which include both abandoned callers who re-engaged with their purchase and otherwise.'],
  ['text', 'Using these two datasets you will determine whether the online ads MightyHive sent to "Martin\'s Travel Agency" customers had an effect on converting "abandoned" callers to make a reservation. A key for the datasets is provided below:'],
]

project_spec_content_two = [
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
  ['text', '"Contact_Phone" - Phone number caller submits'],
  ['text', '"Test_Control" - Test/Control identification'],
]

project_spec_content_three = [
  ['text', 'Download the Abandoned data set:'],
  ['link', 'wwww.link this'],
  ['text', 'Download the Reservation data:'],
  ['link', 'www.link this'],
]


project_spec_step = Step.create!(
  title: "Data",
  lesson: project_overview_lesson
)

project_spec_slide = Slide.create!(
  content: project_spec_content,
  parent: project_spec_step
)

project_spec_slide_two = Slide.create!(
  content: project_spec_content_two,
  parent: project_spec_step
)

project_spec_slide_three = Slide.create!(
  content: project_spec_content_three,
  parent: project_spec_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


project_experiment_content = [
  ['text', 'MightyHive randomly split the "abandoned" callers into test/control buckets.'],
  ['text', 'The test group was shown ads online for a period of 7 days.'],
  ['text', 'The control group was never shown ads'],
  ['text', 'Given this experiment setting, think about how you would use the resulting datasets to determine the necessary results.']
]

project_experiment_step = Step.create!(
  title: "Experiment Details",
  lesson: project_overview_lesson
)

project_spec_slide = Slide.create!(
  content: project_experiment_content,
  parent: project_experiment_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


analysis_strategy_content = [
  ['text', 'The first step is to look at the data in both datasets and formulate a strategy for tackling the problem at hand. How do we know whether an "abandoned" caller eventually made a reservation?'],
  ['text', 'The simple answer is that any observation which is included from both the abandoned and reservation datasets would be a conversion. What then determines a match for observations?'],
  ['text', 'Is the first and last name enough? Looking at the data there is also quite a large number of missing values. If you looked deep enough in the data there are also several observations which have the last name "WebTest" and shouldn\'t be considered in our analysis.'],
]

analysis_strategy_content_two = [
  ['text', 'There are enough unknowns in this dataset to make a "correct" answer impossible. However we will go through one possible solution which includes major processes of how this was done in actuality at MightyHive.'],
  ['text', 'The first step is data matching abandoned observations with reservation observations. We do this first to determine the total possible number of conversions for both the test and control groups. '],
  ['text', 'The second step is to do data cleaning. Filtering the resulting possible conversions to only the ones which are plausible. The final step is in the actual analysis where we define our hypothesis test and perform statistical analysis.'],
]

analysis_strategy_lesson = Lesson.create!(
  title: "Analysis Strategy",
  project: project,
)

analysis_strategy_slide_one = Slide.create!(
  content: analysis_strategy_content,
  parent: analysis_strategy_lesson
)

analysis_strategy_slide_two = Slide.create!(
  content: analysis_strategy_content_two,
  parent: analysis_strategy_lesson
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_matching_lesson_content = [
  ['text', 'In the perfect situation, we could match each reservation observation exactly with the resulting reservation observation if it occured.'],
  ['text', 'However the reality of the situation is that call center workers sometimes forget to input customer information, input incorrect information, or any other human error you can think of. For our analysis we define matched data as any observation which a match in Incoming_Phone.'],
]


data_matching_lesson = Lesson.create!(
  title: "Data Matching",
  project: project
)

data_matching_slide = Slide.create!(
  content: data_matching_lesson_content,
  parent: data_matching_lesson
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

initial_setup_step_content = [
  ['text', 'Lets read in our data into RStudio. Because we are missing a lot of data we set the parameter na.strings = "" so that any blank values are set to NA. This makes it easier to see which values in our dataset are missing.'],
  ['code', 'raw_abandoned_data <- read.csv("Abandoned_Data_Seed.csv", head = T, na.strings = "", stringsAsFactors = F)'],
  ['code', 'raw_reservation_data <- read.csv("Reservation_Data_Seed.csv", head = T, na.strings = "", stringsAsFactors = F)'],
  ['text', 'Since we only want to check for matches in Incoming_Phone, we can remove many of the columns which are unnecssary for our analysis. We want to make sure to include the last name column to filter out the "WebTest" observations.'],
  ['text', 'To create this simplified dataset use the cbind() function which concatenates entire columns in R.'],
]

initial_setup_step_content_two = [
  ['code','abndData <- as.data.frame(cbind(raw_abandoned_data$Session, raw_abandoned_data$Last_Name, raw_abandoned_data$Email,'],
  ['code', '                                raw_abandoned_data$Incoming_Phone, raw_abandoned_data$Contact_Phone, raw_abandoned_data$Test_Control),'],
  ['code','                          stringsAsFactors = F)'],
  ['text', 'We re-label the columns'],
  ['code', 'colnames(abndData) <- c("SESSION_A", "LAST_NAME_A", "EMAIL_A", "INCOMING_PHONE_A", "CONTACT_PHONE_A", "TEST_CONTROL_A")'],
  ['text', 'We do the same for the reservation dataset'],
]

initial_setup_step_content_three = [
  ['code', 'resData <- as.data.frame(cbind(raw_reservation_data$Session, raw_reservation_data$Last_Name, raw_reservation_data$Email,'],
  ['code', '                               raw_reservation_data$Incoming_Phone, raw_reservation_data$Contact_Phone, raw_reservation_data$Test_Control),'],
  ['code', '                         stringsAsFactors = F)'],
  ['code', 'colnames(resData) <- c("SESSION_R", "LAST_NAME_R", "EMAIL_R", "INCOMING_PHONE_R", "CONTACT_PHONE_R", "TEST_CONTROL_R")'],
  ['text', 'Because it is ultimately the reservation dataset that includes all conversions, we will add column to the reservation dataset (which we have re-named resData) which identify if there was a match in the abandoned dataset or not.'],
  ['text', 'Lets first add a new column that will identify if a conversion occured.'],
  ['code', 'resData$CONV <- 0'],
]

initial_setup_step = Step.create!(
  title: "Initial Setup",
  lesson: data_matching_lesson
)

initial_setup_slide_one = Slide.create!(
  content: initial_setup_step_content,
  parent: initial_setup_step
)

initial_setup_slide_two = Slide.create!(
  content: initial_setup_step_content_two,
  parent: initial_setup_step
)

initial_setup_slide_three = Slide.create!(
  content: initial_setup_step_content_three,
  parent: initial_setup_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


matching_step_content = [
  ['text', 'Then we can add an additional column which will identify if a match occured between the abandoned and reservation datasets in Incoming_Phone.'],
  ['code', 'resData$INCOMING_PHONE_MATCH <- 0'],
  ['text', 'The next step is to determine when there is a data match. Lets first take a look at the data we are working with.'],
  ['code', 'abndData$INCOMING_PHONE_A'],
  ['text', 'Scrolling through this data you should notice two things. (1) There are tons of NA values, and (2) each value which isn\'t NA is in quotations which signifies its of character class. You can verify this by using the class() function.'],
  ['code', 'class(abndData$INCOMING_PHONE_A[1])'],
]

matching_step_content_two = [
  ['text', 'For each incoming phone observation that is not NA, we want to check to see if there is a matching observation in the reservation data in either the Incoming_Phone column or the Contact_Phone column. We use the which() function in R to find the matches. Try'],
  ['code', 'which(abndData$INCOMING_PHONE_A[88] == resData$INCOMING_PHONE_R)'],
  ['text', 'This returns the row in the reservation dataset which the 88th phone number in the abandoned dataset matches. Verify for this on your own by manually checking the index. '],
  ['code', 'abndData$INCOMING_PHONE_A[88]'],
  ['code', 'resData$INCOMING_PHONE_R[16685]'],
  ['text', 'What is the phone number that is matched?'],
  ['quiz', 'mh_1' ]
]

quiz = Quiz.create!(
  quiz_id: "mh_1",
  answer:"(402)-153-4684)",
)

matching_step_content_three = [
  ['text', 'Lets now save those matched rows into a variable, phone_match, and for each value which is a row in the reservation dataset lets assign a 1 to the match column we created earlier. We create the variable phone_match because there could be more than 1 match!'],
  ['code', 'phone_match = which(abndData$INCOMING_PHONE_A[88] == resData$INCOMING_PHONE_R)'],
  ['code', 'for(i in phone_match) {'],
  ['code', '  resData$INCOMING_PHONE_MATCH[i] <- 1'],
  ['code', '}'],
]

matching_step_content_four = [
  ['text', 'We have now correctly matched phone numbers from the abandoned dataset to the reservation dataset. To make sure our experiment is correct we need to also verify that these matches are for the same Test/Control group.'],
  ['text', 'A match for numbers in different groups are not conversions that we want to track because those are conversions we know are not due to the advertising campaign. Since people could give the same number, especially if they work for a single business.'],
  ['text', 'We can add a simple check for this using logical comparisons. Lets make sure the match we found earlier is in the same experiment group.'],
  ['code', 'if(abndData$TEST_CONTROL_A[88] != resData$TEST_CONTROL_R[16685]) {'],
  ['code', '  print("Different test groups!")'],
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
  ['text', 'We also want to check for phone matches between the Incoming_Phone column and the Contact_Phone column. Lets add a check for skipping NA values and add a second phone_match variable.'],
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
  ['code', '  phone_match_two = which(abndData$INCOMING_PHONE_A[i] == resData$CONTACT_PHONE_R)'],
  ['code', '  for(k in phone_match_two) {'],
  ['code', '    resData$INCOMING_PHONE_MATCH[k] <- 1'],
  ['code', '    if(abndData$TEST_CONTROL_A[i] != resData$TEST_CONTROL_R[k]) {'],
  ['code', '      resData$INCOMING_PHONE_MATCH[k] <- 0'],
  ['code', '    }'],
  ['code','  }'],
  ['code', '}'],
]

matching_step_content_seven = [
  ['text', 'In our CONV column we can now add a 1 if there is a 1 in the INCOMING_PHONE_MATCH column. In our case the CONV column will be the exact same as the INCOMING_PHONE_MATCH column.'],
  ['code', 'for(i in c(1:nrow(resData))) {'],
  ['code', '  if(resData$INCOMING_PHONE_MATCH[i] == 1) {'],
  ['code', '    resData$CONV[i] <- 1'],
  ['code', '  }'],
  ['code', '}'],
]


matching_step = Step.create!(
  title: "Matching Code",
  lesson: data_matching_lesson
)

matching_slide_one = Slide.create!(
  content: matching_step_content,
  parent: matching_step
)


matching_slide_two = Slide.create!(
  content: matching_step_content_two,
  parent: matching_step
)


matching_slide_three = Slide.create!(
  content: matching_step_content_three,
  parent: matching_step
)


matching_slide_four = Slide.create!(
  content: matching_step_content_four,
  parent: matching_step
)


matching_slide_five = Slide.create!(
  content: matching_step_content_five,
  parent: matching_step
)


matching_slide_six = Slide.create!(
  content: matching_step_content_six,
  parent: matching_step
)


matching_slide_seven = Slide.create!(
  content: matching_step_content_seven,
  parent: matching_step
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data_cleaning_content = [
  ['text','Now that we have flagged each of the potential conversions we need to filter out the conversions which should not be included in our analysis. Two types of observations in particular need to be removed.'],
  ['text','First, any observation which has the last name "WebTest" needs to be removed because those are observations that are not real.'],
  ['text','Second, if you noticed when we calculated the phone matching there were observations which matched with multiple rows in the reservation dataset. Brainstorm for yourself a second why this could be the case.'],
]

data_cleaning_content_two = [
  ['text', 'Keeping in mind the client "Martin\'s Travel Agency" business, we assume that reservations under the same number are a result multiple bookings for vacations.'],
  ['text', 'Verification with the client proves this to be a relatively common occurence. Since we do not want to artificially inflate our conversion numbers we must de-duplicate these conversions into single ones.'],
  ['text', 'Luckily duplicate conversions are contained within the test/control groups so we do not have to do additional filtering besides de-duplication.'],
]

data_cleaning_lesson = Lesson.create!(
  title: "Data Cleaning",
  project: project
)

data_cleaning_slide = Slide.create!(
  content: data_cleaning_content,
  parent: data_cleaning_lesson
)

data_cleaning_slide_two = Slide.create!(
  content: data_cleaning_content_two,
  parent: data_cleaning_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

remove_webtest_content = [
  ['text', 'We will first remove all of the observations in the reservation dataset which have the last name "WebTest". These are clearly test users which the client uses for their internal work.'],
  ['text', 'To do this is quite easy but requires an understanding of a new concept, regular expressions. Regular expressions is a language theory for programmers that forms a search pattern for matching strings.'],
  ['text', 'In our case, we want to identify all of the rows which have the last name "WebTest". Using the grep() function in R we can use aregular expression pattern to search through a specified dataset and it will return the rows which contain that regular expression.'],
]

remove_webtest_content_two = [
  ['text', 'Our regular expression is quite simple since the pattern we want to find is an exact character set.'],
  ['code', 'test_index <- grep("WebTest",resData$LAST_NAME_R)'],
  ['text', 'Test_index now contains all of the rows in resData which have "WebTest" as the last name. This was quite easy but regular expressions can get quite complicated when you want to generalize to not specific words but a group of characters.'],
  ['text', 'For example, here is the regular expression for finding all of the emails in resData which are from Gmail.'],
  ['code', 'gmail_index <- grep(".+@gmail.com", resData$EMAIL_R)'],
]

remove_webtest_content_three = [
  ['text','The . signals any single character and + signals the preceeding item occuring one or more times. Therefore this regular expression looks for the following pattern: any character to occur one or more times and then @gmail.com.'],
  ['text', 'With the test_index we can remove these rows'],
  ['code', 'resData <- resData[-c(test_index), ]'],
]

remove_webtest_step = Step.create!(
  title: "Removing WebTest",
  lesson: data_cleaning_lesson
)

remove_webtest_slide = Slide.create!(
  content: remove_webtest_content,
  parent: remove_webtest_step
)

remove_webtest_slide_two = Slide.create!(
  content: remove_webtest_content_two,
  parent: remove_webtest_step
)
remove_webtest_slide_three = Slide.create!(
  content: remove_webtest_content_three,
  parent: remove_webtest_step
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
  ['text', 'We utilize the unique() function to keep only unique rows. When we calculated duplicate rows we included a duplicates check for both the values.'],
  ['code', 'rows_to_remove <- unique(rows_to_remove)'],
  ['text', 'We remove these rows by negatively indexing.'],
  ['code', 'cleaned_conversion_data <- conversion_data[-c(rows_to_remove), ]'],
  ['text', 'And now we have a dataset which only includes conversions which can be attributed to the advertising experiment.'],
]

data_dedup_step = Step.create!(
  title: "Data De-duplication",
  lesson: data_cleaning_lesson
)

data_dedup_slide = Slide.create!(
  content: data_dedup_content,
  parent: data_dedup_step
)

data_dedup_slide_two = Slide.create!(
  content: data_dedup_content_two,
  parent: data_dedup_step
)

data_dedup_slide_three = Slide.create!(
  content: data_dedup_content_three,
  parent: data_dedup_step
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


stat_content = [
  ['text', 'Determining the appropriate statistical test can be a challenge, here we will explain how to use the most common statistical test, the z-test, and also explain why it is appropriate for this data. The first thing to do is to take a look at exactly the data we are performing a statistical test on.'],
  ['text', 'While this data comes from the two datasets we started with, its easier to understand which statistical test to apply when you look at the cleaned data.'],
  ['text', 'We have two groups, test and control, and within each group we have 1\'s and 0\'s. Every 1 is defined as a conversion and 0s are defined as a non-conversion. '],
  ['text', 'Notice that the proportion of the test and control groups is the same as calculating the average of the two groups so we want a statistical test that compares the averages between two groups.'],
  ['text', 'Comparing the averages of two groups implies using either a t-test or a z-test and since we have a fairly large sample size we can use the z-test.'],
]

stat_lesson = Lesson.create!(
  title: "Statistical Analysis",
  project: project
)

stat_slide = Slide.create!(
  content: stat_content,
  parent: stat_lesson
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

hypothesis_content = [
  ['text', 'In any experiment you must first define your null hypothesis. The null hypothesis in experiments is usually that there is no observed effect from the treatment between the test and control groups. '],
  ['text', 'In our case that would mean that the proportion of conversion for the test group is equal to the proportion of the conversion for our control group and the online advertisements MightyHive used had no affect.'],
  ['text', 'Our alternative hypothesis is that there is an effect, specifically the proprtion of the conversion for our test group is GREATER THAN the proportion of conversion in our control group.'],
]

hypothesis_content_two = [
  ['text', 'Lets first calculate these proportions'],
  ['code', 'test_success = length(cleaned_conversion_data$TEST_CONTROL_R[which(cleaned_conversion_data$TEST_CONTROL_R == "test")])'],
  ['code', 'test_total = sum(abndData$TEST_CONTROL_A == "test")'],
  ['code', 'test_proportion = test_success/test_total'],
  ['text', 'What was the number of test conversions?'],
  ['quiz', 'mh_2'],
  ['text', 'What was the total sample size of the test group?'],
  ['quiz', 'mh_3'],
  ['text', 'And do the same for the control group'],
  ['code', 'control_success = length(cleaned_conversion_data$TEST_CONTROL_R[which(cleaned_conversion_data$TEST_CONTROL_R == "control")])'],
  ['code', 'control_total = sum(abndData$TEST_CONTROL_A == "control")'],
  ['code', 'control_proportion = control_success/control_total'],
]


quiz = Quiz.create!(
  quiz_id: "mh_2",
  answer:"245",
)

quiz = Quiz.create!(
  quiz_id: "mh_3",
  answer:"4266",
)


hypothesis_step = Step.create!(
  title: "Hypothesis Test",
  lesson: stat_lesson
)

hypothesis_slide = Slide.create!(
  content: hypothesis_content,
  parent: hypothesis_step
)

hypothesis_slide_two = Slide.create!(
  content: hypothesis_content_two,
  parent: hypothesis_step
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
  ['text', 'The z-score basically says, how many SEs away our observed test statistic is from what we would expect and what we expect is the null hypothesis, that the difference between the two proportions is zero.'],
  ['code', 'z_score <- (test_proportion - control_proportion) / SE'],
  ['text', 'What is our Z score rounded to the tens digit?'],
  ['quiz', 'mh_4'],
]

quiz = Quiz.create!(
  quiz_id: "mh_4",
  answer:"10.2",
)

z_test_content_four = [
  ['text', 'We now use the normal distribution to determine what is the probability of getting a z-score more extreme than the one we observed. Since our test statistic is positive we want to look at the right tail of the normal distribution as defined by where our z-score is on the normal curve.'],
  ['text', 'The area under the curve to the right of the z-score is the chance of getting a test statistic as extreme as, or more extreme than, what we observed, given that the null hypothesis is true. '],
  ['text', 'Therefore since this chance is really small we have a strong case against the null hypothesis and can conclude our alternative to be statistically significant.'],
  ['text', 'We check where our Z score lies on the normal curve with the pnorm() function in R.'],
  ['code', 'pnorm(z_score, lower.tail = F)'],
  ['text', 'This value is known as the P-value. The P-value of a statistics test is the chance of getting a more extreme test statistic assuming that the null hypothesis is right. '],
  ['text', 'Therefore if this chance is really small, we can reject the null hypothesis and when this chance is high, or in most cases greater than 5% we conclude that there is a high enough chance of  getting a more extreme test statistic due to chance so we fail to reject the null hypothesis.'],
  ['text', 'For reference there is a very clear explanation of using the z-test for the difference between two proprtions and the formulas we used at the link below:'],
  ['link', 'http://math.mercyhurst.edu/~griff/courses/m109/Lectures/sect8.4.pdf'],
]

z_test_content_five = [
  ['text', 'R also has a function to perform this statistical test. The first argument is a vector of the counts of successes and the second argument is a vector of counts of total trials.'],
  ['code', 'prop.test(c(test_success,control_success),c(test_total,control_total))'],
  ['text', 'We can also calculate the 95% confidence intervals for our test statistic. This represents the range we are 95% confident the difference between the two proportions lie.'],
  ['code', 'upper_bound <- test_proportion - control_proportion + 1.96*SE'],
  ['code', 'lower_bound <- test_proportion - control_proportion - 1.96*SE'],
  ['text', 'Note that this 95% confidence interval is how the 95% confidence interval is calculated using the prop.test() function in R.'],
]

z_test_step = Step.create!(
  title: "Z-Test Calculation",
  lesson: stat_lesson
)

z_test_slide = Slide.create!(
  content: z_test_content,
  parent: z_test_step
)

z_test_slide_one = Slide.create!(
  content: z_test_content_two,
  parent: z_test_step
)

z_test_slide_two = Slide.create!(
  content: z_test_content_three,
  parent: z_test_step
)

z_test_slide_three = Slide.create!(
  content: z_test_content_four,
  parent: z_test_step
)

z_test_slide_four = Slide.create!(
  content: z_test_content_five,
  parent: z_test_step
)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



