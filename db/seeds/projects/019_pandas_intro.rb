main_page_content = [
  ['text', "In this data lesson we will look at how to work with data stored in a tabular form and then perform exploratory data analysis on it."],
  ['text', "We will be using the Python Data Analysis Library or 'Pandas' to do this."],
  ['text-warning', "You will need to install IPython Notebook for this lesson."],
  ['text-success', "Let's get started!"],
]


project = Project.create!(
  title: "Intro to Pandas (Python)",
  description: main_page_content,
  short_description: "In this lesson, we'll give a brief introduction to Python's Pandas module. You'll need to have Ipython Notebook to properly do all the exercises.",
  number: 19,
  enabled: true,
  has_leaderboard: false,
  category: Project::LESSON,
  uid: 19,
  difficulty: 'Intermediate',
  is_new: true,
  cover_photo: "pandas",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content = [
  ['text-danger', "Make sure you have IPython-Notebook installed for this lesson."],
  ['text', "In this lesson we will look at how to work with data stored in tabular form and perform exploratory data analysis on it."],
  ['text', "We will be using the Python Data Analysis Library or Pandas to do this."],
  ['text-success', "The two main data structures that Pandas supports are Series and DataFrames."],
  ['text', "Series are one-dimensional data structures that are a collection of any data type."],
  ['text', "DataFrames are two dimensional data structures which resemble a database table or an Excel spreadsheet."],
  ['text-info', "In this lesson we will primarily be using DataFrames."],
]

intro_content_two = [
  ['text', "Before you start, download the following file to your working directory and unzip it."],
  ['link', "https://s3.amazonaws.com/leada/pandas_intro_data/wc_day6_1_sample.tar.bz2"],
  ['text', "Then untar via (or use an unarchiving utility):"],
  ['code', "tar -xf wc_day6_1_sample.tar.bz2"],
  ['text-warning', "After that, run ipython notebook from your command line."],
  ['code', "ipython notebook"],
  ['text-success', "This will launch a browser window with the IPython Dashboard."],
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
  ['text-info', "NOTE: In the iPython notebook you'll need to use Cntrl + Enter or click the play button to execute code in a cell."],
]

intro_content_four = [
  ['text', "If you need clarifications about the Pandas API you can type the function name, followed by ? to get inline help."],
  ['text', "For example to get help with the above call, run:"],
  ['code', "pd.DataFrame?"],
  ['quiz', "pd_intro_0"],
  ['text-info', "Now let's take a look at some DataFrame basics!"],
  ['next_steps', ""],
]

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

intro_slide_four = Slide.create!(
  content: intro_content_four,
  slide_id: 3,
  parent: intro_lesson,
)

quiz_intro_pd = ExactAnswerQuiz.create!(
  quiz_id: "pd_intro_0",
  answer: "5",
  project: project,
  slide: intro_slide_four,
  question: "How many Parameters does the documentation from the above show?",
)

#################################################################################
###############  PD Basics  ##################################################
#################################################################################

dataframe_basics_intro = [
  ['text-success', "We will now do a bit more practice with DataFrames."],
  ['text', "We'll start with some more basics."],
  ['lesson_links', ""],
]

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
  ['text-success', "The simplest way to see the content of a DataFrame is to just print it to the console."],
  ['text', "For example, to see the DataFrame we created earlier, you can just type df:"],
  ['code', "df"],
  ['quiz', "pd_intro_1"],
  ['text', "Note that we didn't actually use the 'print()' function, which you could have used as well."],
]

dataframe_basics_content_two = [
  ['text', "However, large DataFrames cannot be printed to the console, therefore we have to use higher level commands to inspect its contents."],
  ['text-success', "To get information on the schema of the DataFrames, we can use the info() function."],
  ['code', "df.info()"],
  ['text', "To see the first few rows you can use head()."],
  ['text', "To see the last few rows you can use tail()."],
  ['text-info', "This is similar to the UNIX-command line tools (and R!)"],
  ['code', "df.head(2)"],
  ['quiz', "pd_df_basic_2"],
]

dataframe_basics_content_three = [
  ['text-success', "To print any range of rows from the DataFrame you can use array-like indexing of row ids."],
  ['text', "As you might have noticed, rows are numbered from 0 in Pandas, so to get the middle two rows we can use the range 1:3"],
  ['code', "df[1:3]"],
  ['text', "Finally, Pandas also has a useful function describe() that summarizes the contents of numerical columns in a DataFrame."],
  ['text', "For example, in df we can see the mean, standard deviation, etc. by running describe()."],
  ['code', "df.describe()"],
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

pd_df_basic_2 = ExactAnswerQuiz.create!(
  quiz_id: "pd_df_basic_2",
  answer: "df.head(4)",
  project: project,
  slide: data_frame_basic_slide_two,
  question: "How many rows of data did the earlier command create?",
)

pd_df_basic_4 = ExactAnswerQuiz.create!(
  quiz_id: "pd_df_basic_3",
  answer: "3.25",
  project: project,
  slide: data_frame_basic_slide_three,
  question: "What code would return the first 4 rows of the df?",
)

pd_intro_one = ExactAnswerQuiz.create!(
  quiz_id: "pd_intro_1",
  answer: "4",
  project: project,
  slide: data_frame_basic_slide_one,
  question: "What is at the 75% quantile of col a? (omit trailing zeros)",
)

#################################################################################

dataframe_basics_content_four = [
  ['text', "Now that we know the basics, let's see how we can use Pandas for data analysis."],
  ['text-info', "Now we'll work with the sampled data you downloaded earlier:"],
  ['code', "log_df = pd.read_csv('/path/to/wc_day6_1_sample.csv',
    names=['ClientID', 'Date', 'Time', 'URL', 'ResponseCode', 'Size'],
    na_values=['-'])"],
  ['text', "The 'names' argument tells Pandas what the column titles are in our file, and 'na_values' indicates which character is used for missing values in our dataset."],
  ['text', "Try using the commands from the previous section to explore the dataset."],
  ['quiz', "pd_df_basic_4"],
]

dataframe_basics_content_five = [
  ['quiz', "pd_df_basic_5"],
]

dataframe_basics_content_six = [
  ['quiz', "pd_df_basic_6"],
  ['text-success', "Great!"],
  ['next_steps', ""],
]

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

data_frame_basic_slide_six = Slide.create!(
  content: dataframe_basics_content_six,
  slide_id: 2,
  parent: data_frame_basic_conclusion,
)

pd_df_basic_4 = ExactAnswerQuiz.create!(
  quiz_id: "pd_df_basic_4",
  answer: "500",
  project: project,
  slide: data_frame_basic_slide_four,
  question: "What is the max ResponseCode? (omit trailing zeros and any period)",
)

pd_df_basic_5 = ExactAnswerQuiz.create!(
  quiz_id: "pd_df_basic_5",
  answer: "200000",
  project: project,
  slide: data_frame_basic_slide_five,
  question: "How many row entries are present in log_df?",
)

pd_df_basic_6 = ExactAnswerQuiz.create!(
  quiz_id: "pd_df_basic_6",
  answer: "/images/s102443.gif",
  project: project,
  slide: data_frame_basic_slide_six,
  question: "What is the URL at 85th row (remember that indexing starts at 0)?",
)
#################################################################################
###############  PD SQL ops  ####################################################
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
  ['text-info', "A SQL statement typically selects a subset of rows from a table that match a given criteria."],
  ['text', "This is known as the Selection operator in Relational Algebra."],
  ['text', "Similarly, we can perform selections in Pandas using boolean indexing."],
  ['text-success', "Boolean indexing refers to a technique where you can use a list of boolean values to filter a DataFrame."],
  ['text', "For example, say we only want entries from '01/May/1998'. To do this we can create a boolean list:"],
  ['code', "is_may1st = log_df['Date'] == '01/May/1998'"],
  ['code', "is_may1st.head(2)"],
  ['text', "Do you see how we're getting back TRUE and FALSE values?"],
]

sql_selection_content_two = [
  ['text-warning', "Now we can filter our DataFrame by passing the boolean list."],
  ['code' ,"may1_df = log_df[is_may1st]"],
  ['code', "may1_df.head()"],
  ['text', "Alternately, we can directly do this by passing in the boolean clause to the DataFrame:"],
  ['code', "may1_df = log_df[log_df['Date'] == '01/May/1998']"],
  ['code', "may1_df.head()"],
  ['text-success', "Next we'll look at Projections."],
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
  ['text', "To do this with Pandas, we just need to pass in a list of columns that we wish to select."],
  ['text', "For example to only keep the 'URL' and 'ResponseCode' column, we would run:"],
  ['code', "url_codes = log_df[['URL', 'ResponseCode']]"],
  ['code', "url_codes.head(5)"],
  ['text-info', "Note that we passed in a single list of headers to do the projection."],
  ['next_steps', ""],
]

projection_step = Step.create!(
  title: "Projection",
  step_id: 1,
  lesson: sql_op_lesson,
)

projection_slide_one = Slide.create!(
  content: sql_projection_content_one,
  slide_id: 0,
  parent: projection_step,
)

#################################################################################

sql_grouping_content_one = [
  ['text-success', "Pandas also allow you to group the DataFrame by values in any column."],
  ['text', "For example, to group requests by 'ResponseCode' you can run:"],
  ['code', "grouped = log_df.groupby('ResponseCode')"],
  ['code', "grouped"],
  ['text', "As you can see from the output above, 'grouped' is not a DataFrame but an object of type DataFrameGroupBy."],
  ['text', "This just means that it contains a number of groups and each group is in turn a DataFrame:"],
  ['code', "grouped.ngroups"],
  ['code', "grouped.groups.keys()"],
  ['code', "grouped.get_group(200).head()"],
  ['quiz', "pd_sql_grouping_0"],
]

sql_grouping_content_two = [
  ['text-success', "You can also group by multiple columns by simply passing a list of column names."],
  ['text', "For example, to group by both date and response code you can run:"],
  ['code', "multi_grouped = log_df.groupby(['ResponseCode', 'Date'])"],
  ['text-warning', "Pandas also has useful commands to print various statistics about elements in each group."],
  ['text', " 1. grouped.describe() prints summary statistics for numeric columns in each group."],
  ['text', " 2. grouped.size() prints the number of elements in each group."],
  ['text', " 3. Similarly grouped.sum(), grouped.mean() and grouped.median() print the sum, mean, and median values for numeric columns in each group."],
  ['quiz', "pd_sql_grouping_1"],
  ['next_steps', ""],
]

grouping_step = Step.create!(
  title: "Grouping",
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

pd_sql_grouping_quiz = ExactAnswerQuiz.create!(
  quiz_id: "pd_sql_grouping_0",
  answer: "7",
  project: project,
  slide: grouping_slide_one,
  question: "How many groups are there?",
)

pd_sql_grouping_1 = ExactAnswerQuiz.create!(
  quiz_id: "pd_sql_grouping_1",
  answer: "34618",
  project: project,
  slide: grouping_slide_two,
  question: "What is the highest ClientID with the ResponseCode of 302? (omit trailing zeros and any period)",
)

#################################################################################
###############  Apply Functions  ###############################################
#################################################################################

apply_function_main_content = [
  ['text', "So far we have been using SQL-style operators to process our data."],
  ['text', "However to do proper data cleaning or more complex analysis, we often need to apply functions on rows or columns of a DataFrame."],
  ['lesson_links', ""],
]

apply_function_lesson = Lesson.create!(
  title: "DataFrame: Apply Functions",
  lesson_id: 3,
  project: project,
)

apply_function_main_slide = Slide.create!(
  content: apply_function_main_content,
  slide_id: 0,
  parent: apply_function_lesson,
)

#################################################################################

apply_function_example_content = [
  ['text', "For example, consider the columns 'Date' and 'Time' in our Dataframe."],
  ['text-info', "It would be useful if we could combine these columns and create a `DateTime` column. This would be useful for filtering, grouping, etc."],
  ['text', "To create a DateTime column, we will use Pandas helper function: to_datetime()."],
  ['text', "This function takes a string and converts it to a DateTime object."],
  ['text-success', "To call this on every row of the DataFrame, we employ the apply() function."],
  ['text', "apply() takes two arguments:"],
  ['text', " -  The first is a function to apply."],
  ['text', " -  Second is the axes you wish to apply that function. If this should be applied on every row (axis=1) or if this should be applied on every column (axis=0)."],
  ['code', "log_df['DateTime'] = pd.to_datetime(log_df.apply(lambda row: row['Date'] +
    ' ' + row['Time'], axis=1))"],
  ['text', "This might take a minute to run, since we are adding a new column for every request in our table."],
]

apply_function_example_content_two = [
  ['text', "Meanwhile, take a look at the various components of DateTime objects in the API documentation."],
  ['link', "http://pandas.pydata.org/pandas-docs/stable/api.html#time-date-components"],
  ['text', "For example if we want to group by the 'hour', we can now use the DateTime API instead of doing any string parsing."],
  ['code', "hour_grouped = log_df.groupby(lambda row: log_df['DateTime'][row].hour)"],
  ['code', "hour_grouped.ngroups"],
  ['text-success', "Finally, note that you can apply operations on each group using another apply() method."],
  ['text-info', "This is similar to what we saw earlier except the apply() method is now called once per group."],
  ['text-warning', "[Optional] Now try to create a new column that contains the ResponseSize in kilo bytes."],
  ['next_steps', ""],
]

apply_function_step = Step.create!(
  title: "Apply() Examples",
  step_id: 0,
  lesson: apply_function_lesson,
)

apply_function_slide_one = Slide.create!(
  content: apply_function_example_content,
  slide_id: 0,
  parent: apply_function_step,
)

apply_function_slide_one = Slide.create!(
  content: apply_function_example_content_two,
  slide_id: 1,
  parent: apply_function_step,
)

#################################################################################
###############  Basic Plots  ###################################################
#################################################################################

plotting_content = [
  ['text', "In a future lesson we will look at plotting in greater detail."],
  ['text-info', "However we can produce simple plots using the Python matplotlib library with a DataFrame."],
  ['text-success', "To plot a Series or a DataFrame you can just call plot() on the object and for a histogram just call hist()."],
  ['code', "rand_df = pd.DataFrame({'a' : randn(100)})"],
  ['code', "rand_df.plot()"],
  ['code', "rand_df.hist()"],
  ['code', "pd.DataFrame.plot?"],
  ['quiz', "pd_plotting_intro_0"],
  ['text-warning', "[Optional] Generate a histogram of traffic to the site every half-hour and plot this."],
  ['next_steps', ""],
]

plotting_lesson = Lesson.create!(
  title: "Plotting in Pandas",
  lesson_id: 4,
  project: project,
)

plotting_slide = Slide.create!(
  content: plotting_content,
  slide_id: 0,
  parent: plotting_lesson,
)

pd_plotting_intro_0 = ExactAnswerQuiz.create!(
  quiz_id: "pd_plotting_intro_0",
  answer: "instancemethod",
  project: project,
  slide: plotting_slide,
  question: "What is the 'type' of the above help query?",
)

#################################################################################
###############  Basic Plots  ###################################################
#################################################################################

pd_conclusion_content = [
  ['text', "Now you've experienced some of the basic functionalities of the Pandas package."],
  ['text-danger', "To practice further, here are a few questions to consider:"],
  ['text-warning', " 1.  What is the average file size for images (.gif or .jpg or .jpeg files) which had response code 200 ? What is the standard deviation?"],
  ['text-warning', " 2.  We wish to see if there is any correlation between client-ids and hours of the day at which they visit the website. Get 100 random client ids from the dataset and plot a scatter plot that shows the hours of the day these clients sent requests."],
  ['text-warning', " 3.  Generate a histogram of traffic to the site every half-hour and plot this."],
  ['text-success', "Good Job!"],
  ['finish_project_button', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
]

pd_conclusion_lesson = Lesson.create!(
  title: "Pands Intro Conclusion",
  lesson_id: 5,
  project: project,
)

pd_conclusion_slide = Slide.create!(
  content: pd_conclusion_content,
  slide_id: 0,
  parent: pd_conclusion_lesson,
)
