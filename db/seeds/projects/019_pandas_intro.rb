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

main_page_content = [
  ['text', "In this lab exercise we will look at how to work with data stored in a tabular form and perform exploratory data analysis on it."],
  ['text', "We will be using the Python Data Analysis Library or Pandas to do this."],
]

welcome_lesson = Lesson.create!(
  title: "Pandas Intro",
  lesson_id: 0,
  project: project,
)

welcome_slide_one = Slide.create!(
  content: main_page_content,
  slide_id: 0,
)

################################################################################

intro_content = [
  ['text', "The two main data structures that Pandas supports are Series and DataFrames."],
  ['text', "Series are one-dimensional data structures that are a collection of any data type."],
  ['text', "DataFrames on the other hand are two dimensional data structures which resemble a database table or say an Excel spreadsheet."],
  ['text', "In this lab we will primarily be using DataFrames and will look at operations that we can perform using them."],
]

intro_content_two = [
  ['text', "Before you start, download the following file to your home directory (i.e /home/saasbook) and unzip it."],
  ['code', "wget https://raw.github.com/amplab/datascience-sp14/master/lab2/data/wc_day6_1_sample.tar.bz2"],
  ['text', "tar -xf wc_day6_1_sample.tar.bz2"],
  ['text', "After that run ipython notebook from your command line."],
  ['text', "This will launch a browser window with the iPython Dashboard"],
  ['text', "IPython notebook provides an interactive environment for using Python"],
  ['text', "Click on New Notebook to create a new notebook"],
  ['text', "We'll first import pylab, a library that supports plotting and direct plots to be shown line."],
]

intro_conetnt_three = [
  ['text', "Next we will import the Pandas library and create a simple DataFrame, by running"],
  ['code', "from pylab import *"],
  ['code', "%matplotlib inline"],
  ['code', "import pandas as pd"],
  ['code', "df = pd.DataFrame( { 'a' : [1, 2, 3, 4], 'b': [ 'w', 'x', 'y', 'z'] })"],
]

intro_content_four = [
  ['text', "NOTE: In the iPython notebook you'll need to use Cntrl + Enter or click the play button to execute code in a cell."],
  ['text', "If you need clarifications about the Pandas API you can type the function name followed by ? to get inline help."],
  ['text', "For example to get help with the above call run:"],
  ['code', "pd.DataFrame?"],
  ['text', "If you want to see the same in a browser lookup the function in the API documentation."],
]

intro_lesson = Lesson.create!(
  title: "Intro to Pandas",
  lesson_id: 1,
  project: project
)

intro_slide_one = Slide.create!(
  content: intro_content,
  slide_id: 0
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
