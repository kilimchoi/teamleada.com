main_page_content = [
  ['text', "In this lab exercise we will look at how to work with data stored in a tabular form and perform exploratory data analysis on it."],
  ['text', "We will be using the Python Data Analysis Library or Pandas to do this."],  
]


project = Project.create!(
  title: "Intro to Pandas (Python)",
  description: main_page_content,
  short_description: "In this lesson, we'll give a brief introduction to Pyhton's Pandas module",
  number: 19,
  enabled: true,
  has_leaderboard: false,
  has_submit: false,
  category: Project::LESSON,
  uid: 19,
  difficulty: 'Intermediate',
  is_new: true,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content = [
  ['text', "In this lab exercise we will look at how to work with data stored in a tabular form and perform exploratory data analysis on it."],
  ['text', "We will be using the Python Data Analysis Library or Pandas to do this."],
  ['text-success', "The two main data structures that Pandas supports are Series and DataFrames."],
  ['text', "Series are one-dimensional data structures that are a collection of any data type."],
  ['text', "DataFrames on the other hand are two dimensional data structures which resemble a database table or say an Excel spreadsheet."],
  ['text-info', "In this lab we will primarily be using DataFrames and will look at operations that we can perform using them."],
]

intro_content_two = [
  ['text', "Before you start, download the following file to your working directory and unzip it."],
  ['code', "wget https://raw.github.com/amplab/datascience-sp14/master/lab2/data/wc_day6_1_sample.tar.bz2"],
  ['code', "tar -xf wc_day6_1_sample.tar.bz2"],
  ['text-warning', "After that, run ipython notebook from your command line."],
  ['code', "ipython notebook"],
  ['text-success', "This will launch a browser window with the iPython Dashboard."],
  ['text', "IPython notebook provides an interactive environment for using Python."],
  ['text', "Click on New Notebook to create a new notebook."],
  ['text', "We'll first import pylab, a library that supports plotting and direct plots to be shown line."],
]

intro_content_three = [
  ['text', "Next we will import the Pandas library and create a simple DataFrame, by running:"],
  ['code', "from pylab import *"],
  ['code', "%matplotlib inline"],
  ['code', "import pandas as pd"],
  ['code', "df = pd.DataFrame( { 'a' : [1, 2, 3, 4], 'b': [ 'w', 'x', 'y', 'z'] })"],
  ['text', "NOTE: In the iPython notebook you'll need to use Cntrl + Enter or click the play button to execute code in a cell."],
]

intro_content_four = [
  ['text', "If you need clarifications about the Pandas API you can type the function name, followed by ? to get inline help."],
  ['text', "For example to get help with the above call run:"],
  ['code', "pd.DataFrame?"],
  ['text', "If you want to see the same in a browser lookup the function in the API documentation."],
  ['text', "How many Paramters does the documentation from the above show?"],
  ['quiz', "pd_intro_0"],
  ['text-info', "Now let's take a look at some DataFrame basics!"],
  ['next_steps', ""],
]

quiz_intro_pd = Quiz.create!(
  quiz_id: "pd_intro_0",
  answer: "5",
)

intro_lesson = Lesson.create!(
  title: "Intro to Pandas",
  lesson_id: 0,
  project: project
)

intro_slide_one = Slide.create!(
  content: intro_content,
  slide_id: 0,
  parent: intro_lesson,
)

intro_slide_two = Slide.create!(
  content: intro_content_two,
  slide_id: 1,
  parent: intro_lesson,
)

intro_slide_three = Slide.create!(
  content: intro_content_three,
  slide_id: 2,
  parent: intro_lesson,
)

intro_slide_two = Slide.create!(
  content: intro_content_four,
  slide_id: 3,
  parent: intro_lesson,
)

#################################################################################
###############  PD Basics  ##################################################
#################################################################################

dataframe_basics_intro = [
  ['text-success', "We'll now get acquainted with DataFrames better."],
  ['text', "We'll start with some more basics."],
  ['lesson_links', ""],
]

pd_df_basic_2 = Quiz.create!(
  quiz_id: "pd_df_basic_2",
  answer: "df.head(4)",
)

pd_df_basic_2 = Quiz.create!(
  quiz_id: "pd_df_basic_3",
  answer: "3.25",
)

pd_intro_one = Quiz.create!(
  quiz_id: "pd_intro_1",
  answer: "4",
)

data_frame_basic_lesson = Lesson.create!(
  title: "DataFrames",
  lesson_id: 1,
  project: project,
)

data_frame_basic_intro = Slide.create!(
  content: dataframe_basics_intro,
  slide_id: 0,
  parent: data_frame_basic_lesson,
)

#################################################################################

dataframe_basics_content = [
  ['text', "The simplest way to see what is in a DataFrame is to just print it to the console"],
  ['text', "For example to see the DataFrame we created before you can just type df and see the following"],
  ['code', "df"],
  ['text', "How many rows of data did the above command create?"],
  ['quiz', "pd_intro_1"],
]

dataframe_basics_content_two = [
  ['text', "However large DataFrames cannot be printed to the console, and we have higher level commands to inspect its contents."],
  ['text-success', "To get information on the schema of the DataFrames, we can use the info() function."],
  ['code', "df.info()"],
  ['text', "To see the first few rows you can use head() and to see the last few rows you can use tail()."],
  ['text-info', "This is similar to the UNIX-command line tools (and R!)"],
  ['code', "df.head(2)"],
  ['text', "What code would return the first 4 rows of the df?"],
  ['quiz', "pd_df_basic_2"],
]

dataframe_basics_content_three = [
  ['text-success', "To print any range of rows from the DataFrame you can use array-like indexing of row ids."],
  ['text', "As you might have noticed rows are numbered from 0 in Pandas, so to get the middle two rows we can use the range 1:3"],
  ['code', "df[1:3]"],
  ['text', "Finally, Pandas also has a useful function describe that summarizes the contents of numerical columns in a DataFrame."],
  ['text', "For example in df we can see the mean, standard deviation etc. for the column a by running describe."],
  ['code', "df.describe()"],
  ['text-warning', "What is at the 75% quantile of col a? (omit trailing zeros)"],
  ['quiz', "pd_df_basic_3"],
  ['next_steps', ""],
]

data_frame_basic_step = Step.create!(
  title: "DataFrame Basics",
  step_id: 0,
  lesson: data_frame_basic_lesson,
)

data_frame_basic_slide_one = Slide.create!(
  content: dataframe_basics_content,
  slide_id: 0,
  parent: data_frame_basic_step,
)

data_frame_basic_slide_two = Slide.create!(
  content: dataframe_basics_content_two,
  slide_id: 1,
  parent: data_frame_basic_step,
)

data_frame_basic_slide_three = Slide.create!(
  content: dataframe_basics_content_three,
  slide_id: 2,
  parent: data_frame_basic_step,
)

#################################################################################

dataframe_basics_content_four = [
  ['text', "Now that we know the basics, let's see how we can use Pandas for data analysis."],
  ['text-info', "To do this part of the lab, we will use the World Cup soccer data, which you can get here:"],
  ['fail-link', "link to wc data"],
  ['code', "log_df = pd.read_csv('/path/to/wc_day6_1_sample.csv
    names=['ClientID', 'Date', 'Time', 'URL', 'ResponseCode', 'Size'],
    na_values=['-'])"],
  ['text', "The names argument tells Pandas what the column names are in our file, and na_values indicates which character is used for missing values in our dataset."],
  ['text', "Try using the commands from the previous section to explore the dataset."],
  ['text-warning', "What is the mean of the data?"],
  ['quiz', "pd_df_basic_4"],
]

dataframe_basics_content_five = [
  ['text', "How many rows are present in log_df?"],
  ['quiz', "pd_df_basic_5"],
  ['text', "What are the URLs between rows 85 and 90?"],
  ['quiz', "pd_df_basic_6"],
  ['text-success', "Great!"],
  ['next_steps', ""],
]

pd_df_basic_5 = Quiz.create!(
  quiz_id: "pd_df_basic_5",
  answer: "XXX",
)
pd_df_basic_6 = Quiz.create!(
  quiz_id: "pd_df_basic_6",
  answer: "XXX",
)

data_frame_basic_conclusion = Step.create!(
  title: "DataFrame Conclusion",
  step_id: 1,
  lesson: data_frame_basic_lesson,
)

data_frame_basic_slide_four = Slide.create!(
  content: dataframe_basics_content_four,
  slide_id: 0,
  parent: data_frame_basic_conclusion,
)

data_frame_basic_slide_five = Slide.create!(
  content: dataframe_basics_content_five,
  slide_id: 1,
  parent: data_frame_basic_conclusion,
)
#################################################################################
###############  PD Basics  #####################################################
#################################################################################

sql_op_lesson_content = [
  ['text-success', "Next we will look at operators in Pandas that allow us to perform SQL-like queries on the dataset."],
  ['lesson_links', ""],
]

sql_op_lesson = Lesson.create!(
  title: "SQL Ops",
  lesson_id: 2,
  project: project,
)

sql_op_main_slide = Slide.create!(
  content: sql_op_lesson_content,
  slide_id: 0,
  parent: sql_op_lesson,
)

#################################################################################

sql_selection_content_one = [
  ['text', "A SQL statement typically selects a subset of rows from a table that match a given criteria."],
  ['text', "This is known as the Selection operator in Relational Algebra."],
  ['text', "Similarly we can perform selections in Pandas using boolean indexing."],
  ['text', "Boolean indexing refers to a technique where you can use a list of boolean values to filter a DataFrame."],
  ['text', "For example lets say we only want entries from '01/May/1998'. To do this we can create a boolean list like"],
  ['code', "is_may1st = log_df['Date'] == '01/May/1998'"],
  ['code', "is_may1st.head(2)"],
]

sql_selection_content_two = [
  ['text', "Now we can filter our DataFrame by passing it the boolean list."],
  ['text' ,"may1_df = log_df[is_may1st]"],
  ['text', "may1_df.head()"],
  ['text', "Or we can directly do this by passing in the boolean clause to the DataFrame"],
  ['code', "may1_df = log_df[log_df['Date'] == '01/May/1998']"],
  ['code', "may1_df.head()"],
  ['next_steps', ""],
]

selection_step = Step.create!(
  title: "Selection",
  step_id: 0,
  lesson: sql_op_lesson,
)

selection_slide_one = Slide.create!(
  content: sql_selection_content_one,
  slide_id: 0,
  parent: selection_step,
)

selection_slide_two = Slide.create!(
  content: sql_selection_content_two,
  slide_id: 1,
  parent: selection_step,
)

#################################################################################

sql_projection_content_one = [
  ['text-success', "While selection is used for filtering rows, projection is the relational algebra operator used to select columns."],
  ['text', "To do this with Pandas we just need to pass in a list of columns that we wish to select."],
  ['text', "For example to only keep the 'URL' and 'ResponseCode' column we would run:"],
  ['code', "url_codes = log_df[['URL', 'ResponseCode']]"],
  ['code', "url_codes.head(5)"],
]

sql_projection_content_two = [
  ['next_steps', ""],
]

projection_step = Step.create!(
  title: "projection",
  step_id: 1,
  lesson: sql_op_lesson,
)

projection_slide_one = Slide.create!(
  content: sql_projection_content_one,
  slide_id: 0,
  parent: projection_step,
)

projection_slide_two = Slide.create!(
  content: sql_projection_content_two,
  slide_id: 1,
  parent: projection_step,
)

#################################################################################

sql_grouping_content_one = [
  ['text-success', "Pandas also allows you to group the DataFrame by values in any column."],
  ['text', "For example to group requests by 'ResponseCode' you can run:"],
  ['code', "grouped = log_df.groupby('ResponseCode')"],
  ['code', "grouped"],
  ['text', "As you can see from the output above, grouped is not a DataFrame but an object of type DataFrameGroupBy"],
  ['text', "This just means that it contains a number of groups and each group is in turn a DataFrame:"],
  ['code', "grouped.ngroups"],
  ['code', "grouped.groups.keys()"],
  ['code', "grouped.get_group(200).head()"],
  ['text-warning', "How many groups were there?"],
  ['quiz', "pd_sql_grouping_0"],
]

sql_grouping_content_two = [
  ['text-success', "You can also group by multiple columns by just passing the a list of column names."],
  ['text', "For example to group by both date and response code you can run:"],
  ['code', "multi_grouped = log_df.groupby(['ResponseCode', 'Date'])"],
  ['text-warning', "Pandas also has useful commands to print various statistics about elements in each group."],
  ['text', " 1. grouped.describe() prints summary statistics for numeric columns in each group."],
  ['text', " 2. grouped.size() prints the number of elements in each group."],
  ['text', " 3. Similarly grouped.sum(), grouped.mean() and grouped.median() print the sum, mean and median values for numeric columns in each group."],
  ['next_steps', ""],
]

pd_sql_grouping_quiz = Quiz.create!(
  quiz_id: "pd_sql_grouping_0",
  answer: "XXX",
)

grouping_step = Step.create!(
  title: "grouping",
  step_id: 2,
  lesson: sql_op_lesson,
)

grouping_slide_one = Slide.create!(
  content: sql_grouping_content_one,
  slide_id: 0,
  parent: grouping_step,
)

grouping_slide_two = Slide.create!(
  content: sql_grouping_content_two,
  slide_id: 1,
  parent: grouping_step,
)

