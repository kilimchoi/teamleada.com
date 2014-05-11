# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'This introduction series will get you through project Anscombe\'s Quartet.'],
  ['text', 'In this particular intro, we\'ll be focusing on Data Objects and Functions.'],
  ['text', 'Knowing the different data objects is important, because data objects hold data.'],
  ['text', 'Ultimately if you\'re working with data, the most important concept is accessing and storing data.'],
  ['text', 'You should now open RStudio on a different screen to follow along.'],
  ['text', 'Happy Learning!']
]

project = Project.create!(
  title: "Anscombe Bootcamp",
  description: main_page_content,
  short_description: "This bootcamp is mean\'t to introduce you to the R programming skills that will enable you to go through the Anscombe Quartets project effectively.",
  number: 2,
  enabled: true
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
################################################################################
#Create
data_object_content = [
		['text', 'Everything in R is an object.'],
  ['text', 'Here we\'ll be focusing on creating the following data obejcts:'],
  ['lesson_links', nil]
]

data_object_lesson = Lesson.create!(
  title: "Creating Data Objects",
  project: project
)

data_object_slide_one = Slide.create!(
  content: data_object_content,
  parent: data_object_lesson
)
################################################################################
vector_data_content_one = [
  ['text', 'Previously we saw how to store values in a vector.'],
  ['text', 'Vector is the basic object in R. Even multipliers/scalars are vectors of length 1.'],
  ['code', 'vector_one = c(1,2,3,4,5,6)'],
  ['code', 'vector_one'],
  ['text', 'To access data in the vector, the syntax in R is to use brackets ([]) and the index number of what you want to select.'],
  ['text', 'Unlike most programming languages, R starts indexing at 1 instead of 0'],
  ['code', 'vector_one[1]'],
  ['code', 'vector_one[1:3] #This grabs the first three values'],
  ['text', 'What about invalid requests?'],
  ['code', 'vector_one[0]'],
  ['code', 'vector_one[10]'],
]
vector_data_content_two = [
  ['text', 'Note that you can consider the vector as a single column of a matrix'],
  ['text', 'This means you can apply elementary oeprations via scalar operations, as shown below.'],
  ['code', 'bigger_vector = vector_one * 5'],
  ['code', 'bigger_vector'],
  ['code', 'bigger_vector == vector_one #remember that \'=\' assigns values, whereas \'==\' compares.'],
  ['text', 'This means vector wise comparison works too!'],
  ['code', 'bigger_vector == (vector_one * 5)'],
  ['code', 'bigger_vector - vector_one'],
  ['code', 'class(bigger_vector)'],
  ['text', 'Keep in mind that we\'re not assigning the result from the minus operations above;'],
  ['text', 'This means the values are printed, and then lost. All most reasons for us to use data types to save them!'],
  ['next_steps', nil]
]

vector_data_step = Step.create!(
  title: "Construct Vectors",
  lesson: data_object_lesson
)

vector_data_slide_one = Slide.create!(
  content: vector_data_content_one,
  parent: vector_data_step
)
vector_data_slide_two = Slide.create!(
  content: vector_data_content_two,
  parent: vector_data_step
)
################################################################################

matrix_data_content_one = [
	['text' ,'A natural extension of Vectors is the Matrix.'],
	['code','row_wise = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=2, ncol=3, byrow = TRUE)'],
	['code','col_wise = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=2, ncol=3, byrow = FALSE)'],
	['code','row_wise'],
	['code','col_wise'],
	['code','class(col_wise)'],
	['text','Can you guess how this works?'],
	['text','We feed it the vector data via "data=" option.'],
	['text','We\'ll tell it how many rows and columns via "nrow=" and "ncol=" option.'],
	['text','"byrow" specifies the order in which we populate the matrix: row-wise or column-wise.'],
]
matrix_data_content_two = [
	['text', 'What about a mal-formed requests? Try it! We encourage you to try weird things. Who knows, it might work ;)'],
	['text', 'We try to create a 10 by 10 matrx below, while only giving it 6 data points. What happens?'],
	['code', 'weird_matrix = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=10, ncol=10, byrow = TRUE)'],
	['text', 'You get a warning message. But did it work? YES! R tries to create the matrix.'],
	['text', 'It does so by repeating the data you specified enough times (last repetition is partial) to fill the matrix.'],
	['text', '(this isn\'t recommended until you\'re more familiar with R)'],
	['code', 'weird_matrix'],
	['text', 'Wherelse could you have gotten that information?'],
	['code', 'help(matrix)'],
	['text', 'WOAH! It offers the same information we just imparted. It also has useful examples at the very bottom.'],
	['text', 'Help is always there if you need it.'],
]

matrix_data_step = Step.create!(
  title: "Construct Matrices",
  lesson: data_object_lesson
)

matrix_data_slide_one = Slide.create!(
  content: matrix_data_content_one,
  parent: matrix_data_step
)
matrix_data_slide_two = Slide.create!(
  content: matrix_data_content_two,
  parent: matrix_data_step
)
################################################################################
dataframe_data_content_one = [
	['text', 'Now that we know a thing or two about matrices, we can move onto dataframes.'],
	['text', 'Don\'t worry, DataFrames are just like matrices.'],
	['code', 'my_numbers = c(6, 7, 8)'],
	['code', 'my_strings = c("I", "Love", "Potatoes")'],
	['code', 'my_logicals = c(FALSE, FALSE, TRUE)'],
	['code', 'my_dataframe = data.frame(my_numbers, my_strings, my_logicals)'],
	['text', 'All we did was append together a few vectors! Check out the dataframe we created.'],
	['text', 'The main difference is that dataframes (can) contain different kinds of data (numbers, words/strings, logicals)'],
	['code', 'my_dataframe'],
	['code', 'class(my_dataframe)'],
]

dataframe_data_content_two = [
	['code', 'names(my_dataframe)'],
	['text', 'With the name() function, we were able to acess the column names of the entries.'],
	['text', 'We can access specific columns via the "$" operator. You\'ll get used to this notation soon.'],
	['code', 'my_dataframe$my_logicals'],
	['code', 'class(my_dataframe$my_logicals)'],
	['text', 'You can also access specific columns as we did before, via column index, starting at 1'],
	['code', 'my_dataframe[1]'],
	['code', 'my_dataframe[2]'],
	['text', 'For now, accessing a column via its index isn\'t recommended. We won\'t be using this until you\'re more comfortable with R.'],
	['project_link', 'Back to the lessons page'],
]
dataframe_data_step = Step.create!(
  title: "Construct Data Frames",
  lesson: data_object_lesson
)

dataframe_data_slide_one = Slide.create!(
  content: dataframe_data_content_one,
  parent: dataframe_data_step
)
dataframe_data_slide_two = Slide.create!(
  content: dataframe_data_content_two,
  parent: dataframe_data_step
)
################################################################################
################################################################################
#Access
data_access_content = [
  ['text', 'Now that we saw how to create data objects, we\'ll see how to access them here.'],
  ['lesson_links', nil]
]

data_access_lesson = Lesson.create!(
  title: "Accessing Data",
  project: project
)

data_access_slide_one = Slide.create!(
  content: data_access_content,
  parent: data_access_lesson
)
################################################################################
matrix_access_content_one = [
	['text', 'Now to access the data we stored. You can specifiy which data point to access by specifying the row and col numbers.'],
	['code', 'test_matrix = matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2) #let\'s first create the matrix'],
	['code', 'test_matrix[1,1]'],
	['code', 'test_matrix[1,10]'],
	['code', 'test_matrix[1,100]'],
	['code', 'test_matrix[1,1000]'],
	['text', 'Do all of the above work?'],
]

matrix_access_content_two = [
	['text', 'What if you give it only one of the numbers? Try it!'],
	['text', 'Do you see a difference between commas and no commas?'],
	['code', 'test_matrix'],
	['code', 'test_matrix[2]'],
	['code', 'test_matrix[2,]'],
	['code', 'test_matrix[,2]'],
	['text', 'Play around, you should notice a specific behavior.'],
]

matrix_access_step = Step.create!(
  title: "Accessing Matrix",
  lesson: data_access_lesson
)

matrix_access_slide_one = Slide.create!(
  content: matrix_access_content_one,
  parent: matrix_access_step
)
matrix_access_slide_two = Slide.create!(
  content: matrix_access_content_two,
  parent: matrix_access_step
)
################################################################################

dataframe_access_content_one = [
	['text', 'Now we\'ll be wrapping up our DataFrame crash course!'],
	['text', 'Since we saw how to get a single column from a dataframe (via "$"), we\'ll see how to access a particular subset.'],
	['code', 'my_dataframe'],
	['code', 'my_dataframe$my_numbers'],
	['code', 'my_dataframe$my_numbers[1]'],
	['code', 'my_dataframe$my_numbers[1:3]'],
	['code', 'my_dataframe$my_numbers[1:10]'],
	['code', 'my_dataframe$my_numbers[1,]'],
	['text', 'Did all of it work?'],
]
dataframe_access_content_two = [
	['text', 'We first chose my_numbers column via "$". Appending the "[1]" returned the first entry from that column.'],
	['text', 'Next, instead of [1], we changed to [1:3] to get index 1 through 3.'],
	['text', 'You might have noticed that [1:10] returned a bunch of NAs. R tries to fill the missing values with "NA".'],
	['text', '"NA" basically means empty/missing'],
	['text', 'What about the one with comma?'],
	['code', 'my_dataframe$my_numbers[1,]'],
	['text', 'It didn\'t work!'],
	['text', 'Don\'t panic though, let\'s interpret the error.'],
]

dataframe_access_content_three = [
	['text', 'R tells us that there is an error, namely "incorrect number of dimensions".'],
	['text', 'This is because "[1,]" tries to access a row.'],
	['text', 'But since the column is a single-dimension vector, if we try to access a row (in a 2-dimensional context), R complains.'],
	['text', 'However this means that "[1,]" can be applied to any 2-dimensional data. Dataframe is one of them.'],
	['code', 'my_dataframe[1,]'],
	['code', 'my_dataframe[,1]'],
	['text', 'This does give us another way of accessing coumns/rows in dataframe.'],
	['text', 'However, this is confusing (as mentioned earlier) so we\'ll ignore accessing dataframe columns via indices (for now).'],
	['project_link', 'Back to the lessons page'],
]
dataframe_access_step = Step.create!(
  title: "Accessing dataframe",
  lesson: data_access_lesson
)

dataframe_access_slide_one = Slide.create!(
  content: dataframe_access_content_one,
  parent: dataframe_access_step
)
dataframe_access_slide_two = Slide.create!(
  content: dataframe_access_content_two,
  parent: dataframe_access_step
)
dataframe_access_slide_three = Slide.create!(
  content: dataframe_access_content_three,
  parent: dataframe_access_step
)
################################################################################
################################################################################
#Function
function_main_content = [
 ['text', 'We\'ll also quickly go over the idea of functions here:'],
 ['text', 'Remember when we called class(some_stuff_here)?'],
	['text', 'The "function_name(target)" does [something] with access to the given "target" (formally, parameters).'],
	['code', 'class(1)'],
	['text', 'The above function is called class, and it works on the number we gave it, namely "1".'],
	['code', 'summary(1)'],
	['text', 'The above function is called summary, and it gives us a summary of the data.'],
	['text', '1 isn\'t interesting, so let\'s try something else.'],
	['code', 'summary(my_dataframe$my_numbers)'],
	['text', 'Voila! We\'re applying the "summary" function to a vector we subsetted from our dataframe!'],
 ['lesson_links', nil]
]
function_lesson = Lesson.create!(
  title: "Functions ()",
  project: project
)
data_access_slide_one = Slide.create!(
  content: function_main_content,
  parent: function_lesson
)
################################################################################

plot_function_content_one = [
	['text', 'One of the important function we\'ll use in Anscombe is the plot() function.'],
	['text', 'As you may have guessed, it plots stuff!'],
	['text', 'So how do we use it? Well, ask for help!'],
	['code', 'help(plot)'],
	['text', 'Note that we omitted the "()" following plot(). This is the convention for help.'],
	['text', 'Usage gives us the specificiation of the function. Don\'t worry about the "(...)" for now.'],
	['text', 'It says to give it X and Y. Simple enough!'],
	['code', 'x_to_plot = c(1,2,3)'],
	['code', 'y_to_plot = c(1,2,3)'],
	['code', 'plot(x_to_plot, y_to_plot, main="first plot woot!")'],
]

plot_function_content_two = [
	['text', 'Our first plot! :)'],
	['text', 'Plot is our primary means of data vizualization.'],
	['text', 'Don\'t worry about the "main=" part, yet (look in help() if you\'re curious).'],
	['text', 'Note that R also gives you the tilda (~) option in plotting.'],
	['code', 'plot(y_to_plot ~ x_to_plot, main="second plot yea!")'],
	['text', 'This plots "y_to_plot" against "x_to_plot". It produces the same plot as before! (with a changed title)'],
	['text', 'Congratz! Now you know how to plot simple graphs!'],
	['text', 'Rember that help(plot) will always give you examples at the bottom.'],
  ['project_link', 'Back to the lessons page'],
]
plot_function_step = Step.create!(
  title: "Plotting via plot()",
  lesson: function_lesson
)

plot_function_slide_one = Slide.create!(
  content: plot_function_content_one,
  parent: plot_function_step
)
plot_function_slide_two = Slide.create!(
  content: plot_function_content_two,
  parent: plot_function_step
)

################################################################################
summary_content_one = [
	['text', 'You\'re now finished with the Anscombe bootcamp.'],
	['text', 'You saw how to:'],
	['text', ' - create/compare/access vectors.'],
	['text', ' - create/access matrices.'],
	['text', ' - create/access/subset dataframes. (It is really similar to matrices!)'],
	['text', ' - understand the basics behind functions.'],
	['text', 'Don\'t worry if you don\'t fully grasp all the concepts.'],
	['text', 'You\'ll become more familair as you do the data projects. This bootcamp is just to get your feet wet.'],
	['text', 'You\'re now ready to take on Anscombe. Charge on!'],
	['project_link', 'Back to the lessons page'],
]
summary_lesson = Lesson.create!(
  title: "Anscombe Bootcamp Summary",
  project: project
)

summary_slide_one = Slide.create!(
  content: summary_content_one,
  parent: summary_lesson
)
################################################################################




