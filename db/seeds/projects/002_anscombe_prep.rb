# Creates the anscombe project on the site!
# Main Page
main_page_content = [
  ['text', 'This introduction series will get you through project Anscombe\'s Quartet.'],
  ['text', 'In this particular intro, we\'ll be focusing on Data Objects and Functions.'],
  ['text', 'Knowing the different data objects is important, because data objects hold data.'],
  ['text', 'Ultimately if you\'re working with data, the most important concept is accessing and storing data.'],
  ['text', 'You should now open RStudio on a different screen to follow along.'],
  ['text', 'Happy Learning!']
]

project = Project.create!(
  title: "Anscombe's Quartet Bootcamp",
  description: main_page_content,
  short_description: "This bootcamp is mean\'t to introduce you to the R programming skills that will enable you to go through the Anscombe Quartets project more effectively.",
  number: 2,
  enabled: true,
  uid: 2,
  difficulty: 'Beginner'
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
  project: project,
  lesson_id: 0,
)

data_object_slide_one = Slide.create!(
  content: data_object_content,
  parent: data_object_lesson,
  slide_id: 0,
)
################################################################################
vector_data_content_one = [
  ['text', 'Previously we saw how to store values in a vector.'],
  ['text', 'Vector is the basic object in R. Even multipliers/scalars are vectors of length 1.'],
  ['code', 'vector_one = c(1,2,3,4,5,6)'],
  ['code', 'vector_one'],
  ['text', 'To access data in the vector, the syntax in R is to use brackets [] and the index number of what you want to select.'],
  ['text', 'Unlike most programming languages, R starts indexing at 1 instead of 0.'],
  ['code', 'vector_one[1]'],
  ['code', 'vector_one[1:3] #This grabs the first three values'],
  ['text', 'What about invalid requests?'],
  ['code', 'vector_one[0]'],
  ['code', 'vector_one[10]'],
]
vector_data_content_two = [
  ['text', 'Note that you can consider a vector as a single column of a matrix'],
  ['text', 'This means you can apply elementary operations via scalar operations, as shown below.'],
  ['code', 'bigger_vector = vector_one * 5'],
  ['code', 'bigger_vector'],
  ['text', 'This means vector wise comparison works too!'],
  ['code', 'bigger_vector == vector_one #remember that \'=\' assigns values, whereas \'==\' compares.'],
  ['code', 'bigger_vector == (vector_one * 5)'],
  ['code', 'bigger_vector - vector_one #vector to vector math!'],
  ['code', 'class(bigger_vector)'],
  ['text', 'Keep in mind that we\'re not assigning the result from the minus operation above;'],
  ['text', 'This means the values are printed and then lost.'],
  ['text', 'If we wanted to use the result, we\'d need to save the result via "=".'],
  ['next_steps', nil]
]

vector_data_step = Step.create!(
  title: "Construct Vectors",
  lesson: data_object_lesson,
  step_id: 0,
)

vector_data_slide_one = Slide.create!(
  content: vector_data_content_one,
  parent: vector_data_step,
  slide_id: 0,
)

vector_data_slide_two = Slide.create!(
  content: vector_data_content_two,
  parent: vector_data_step,
  slide_id: 1,
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
	['text','We give the matrix() function the vector-data via "data=" option.'],
	['text','We then tell it how many rows and columns via "nrow=" and "ncol=" option.'],
	['text','"byrow" specifies the order in which we populate the matrix: row-wise or column-wise.'],
	['text','R handles the rest.'],
]
matrix_data_content_two = [
	['text', 'What about mal-formed requests? Try it! We encourage you to try weird things. Who knows, it might work!'],
	['text', 'We try to create a 10 by 10 matrx below, while only giving it 6 data points. What happens?'],
	['code', 'weird_matrix = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=10, ncol=10, byrow = TRUE)'],
	['text', 'You get a warning message. But did it work? YES! R tries to create the matrix.'],
	['text', 'It does so by repeating the data enough times (last repetition is partial) to fill the matrix.'],
	['text', '(this isn\'t recommended until you\'re more familiar with R)'],
	['code', 'weird_matrix'],
	['text', 'Where else could you have gotten that information?'],
	['code', 'help(matrix)'],
	['text', 'WOAH! It offers the same information we just imparted. It also has useful examples at the very bottom.'],
	['text', 'Help is always there if you need it.'],
	['next_steps', nil]
]

matrix_data_step = Step.create!(
  title: "Construct Matrices",
  lesson: data_object_lesson,
  step_id: 1,
)

matrix_data_slide_one = Slide.create!(
  content: matrix_data_content_one,
  parent: matrix_data_step,
  slide_id: 0,
)

matrix_data_slide_two = Slide.create!(
  content: matrix_data_content_two,
  parent: matrix_data_step,
  slide_id: 1,
)

################################################################################
dataframe_data_content_one = [
	['text', 'Now that we know a thing or two about matrices, we can move on to dataframes.'],
	['text', 'Don\'t worry, DataFrames are just like matrices.'],
	['code', 'my_numbers = c(6, 7, 8)'],
	['code', 'my_strings = c("I", "Love", "Potatoes")'],
	['code', 'my_logicals = c(FALSE, FALSE, TRUE)'],
	['code', 'my_dataframe = data.frame(my_numbers, my_strings, my_logicals)'],
	['text', 'All we did was append together a few vectors! Check out the dataframe we created.'],
	['code', 'my_dataframe'],
	['text', 'The main difference is that dataframes (can) contain different kinds of data (numbers, words/strings, logicals.)'],
	['code', 'class(my_dataframe)'],
]

dataframe_data_content_two = [
	['text', 'With the name() function, we can access the column names of the dataframe.'],
	['code', 'names(my_dataframe)'],
	['text', 'We can access specific columns via the "$" operator. You\'ll get used to this notation soon.'],
	['code', 'my_dataframe$my_logicals'],
	['code', 'class(my_dataframe$my_logicals)'],
	['text', 'You can also access specific columns as we did before, via column index, starting at 1'],
	['code', 'my_dataframe[1]'],
	['code', 'my_dataframe[3] #note that this is slightly different from "my_dataframe$my_logicals". More on this later.'],
	['text', 'For now, accessing a column via its index isn\'t recommended. We won\'t be using this until you\'re more comfortable with R.'],
	['next_steps', nil]
]
dataframe_data_step = Step.create!(
  title: "Construct Data Frames",
  lesson: data_object_lesson,
  step_id: 2,
)

dataframe_data_slide_one = Slide.create!(
  content: dataframe_data_content_one,
  parent: dataframe_data_step,
  slide_id: 0,
)
dataframe_data_slide_two = Slide.create!(
  content: dataframe_data_content_two,
  parent: dataframe_data_step,
  slide_id: 1,
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
  project: project,
  lesson_id: 1,
)

data_access_slide_one = Slide.create!(
  content: data_access_content,
  parent: data_access_lesson,
  slide_id: 0,
)

################################################################################
matrix_access_content_one = [
	['text', 'Now to access the data we stored.'],
	['text', 'You can specifiy which data point to access by specifying the row and col numbers.'],
	['code', 'test_matrix = matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2) #let\'s first create the matrix'],
	['code', 'test_matrix[1,1]'],
	['code', 'test_matrix[1,10]'],
	['code', 'test_matrix[1,100]'],
	['code', 'test_matrix[1,1000]'],
	['text', 'Do all of the above work?'],
]

matrix_access_content_two = [
	['text', 'What if you give it only one of the numbers? Try it!'],
	['code', 'test_matrix'],
	['code', 'test_matrix[2]'],
	['text', 'Do you see a difference between commas and no commas?'],
	['code', 'test_matrix[2,]'],
	['code', 'test_matrix[,2]'],
	['text', 'Play around.'],
	['text', 'You should notice a specific behavior.'],
	['next_steps', nil]
]

matrix_access_step = Step.create!(
  title: "Accessing Matrix",
  lesson: data_access_lesson,
  step_id: 0,
)

matrix_access_slide_one = Slide.create!(
  content: matrix_access_content_one,
  parent: matrix_access_step,
  slide_id: 0,
)

matrix_access_slide_two = Slide.create!(
  content: matrix_access_content_two,
  parent: matrix_access_step,
  slide_id: 1,
)

################################################################################

dataframe_access_content_one = [
	['text', 'Now on to the last part: DataFrame.'],
	['text', 'Since we saw how to get a single column from a dataframe (via "$"), we\'ll see how to access a particular subset.'],
	['code', 'my_dataframe'],
	['code', 'my_dataframe$my_numbers'],
	['text', 'We first choose my_numbers column via "$". Appending the "[1]" returns the first entry from that column.'],
	['code', 'my_dataframe$my_numbers[1]'],
	['text', 'Next, instead of [1], we changed to [1:3] to get index 1 through 3.'],
	['code', 'my_dataframe$my_numbers[1:3]'],
]
dataframe_access_content_two = [
	['code', 'my_dataframe$my_numbers[1:10]'],
	['text', 'You might have noticed that [1:10] returned a series of NAs. R tries to fill the missing values with "NA".'],
	['text', '"NA" basically means empty/missing'],
	['text', 'What if we include a comma? Will it work?'],
	['code', 'my_dataframe$my_numbers[1,]'],
	['text', 'It didn\'t work!'],
	['text', 'Don\'t panic though, let\'s interpret the error.'],
]

dataframe_access_content_three = [
	['text', 'R tells us that there is an error, namely "incorrect number of dimensions".'],
	['text', 'This is because [1,] tries to access a row.'],
	['code', '#my_dataframe$my_numbers[1,] #for reference'],
	['text', 'But since the column is a single-dimension vector, if we try to access a row (in a 2-dimensional context), R complains.'],
	['text', 'However this means that [1,] can be applied to any 2-dimensional data. Dataframe is one of them.'],
	['code', 'my_dataframe[1,]'],
	['code', 'my_dataframe[,1]'],
	['text', 'This does give us another way of accessing coumns/rows in dataframe.'],
	['text', 'However, this is confusing (as mentioned earlier) so we\'ll forgo accessing a dataframe column via an index (for now).'],
	['next_steps', nil]
]
dataframe_access_step = Step.create!(
  title: "Accessing dataframe",
  lesson: data_access_lesson,
  step_id: 1,
)

dataframe_access_slide_one = Slide.create!(
  content: dataframe_access_content_one,
  parent: dataframe_access_step,
  slide_id: 0,
)

dataframe_access_slide_two = Slide.create!(
  content: dataframe_access_content_two,
  parent: dataframe_access_step,
  slide_id: 1,
)

dataframe_access_slide_three = Slide.create!(
  content: dataframe_access_content_three,
  parent: dataframe_access_step,
  slide_id: 2,
)
################################################################################
################################################################################
#Function
function_main_content = [
 ['text', 'We\'ll also quickly go over the idea of functions here:'],
 ['text', 'Remember when we called class(some_stuff_here)?'],
	['text', 'The "function_name(parameters)" does {#something} with the given parameters.'],
	['code', 'class(1)'],
	['text', 'The above function is called class, and it works on the number we gave it, namely "1".'],
	['code', 'summary(1)'],
	['text', 'The above function is called summary, and it gives us a summary of the data.'],
	['text', '1 isn\'t interesting, so let\'s try something else.'],
	['code', 'summary(my_dataframe$my_numbers) #we created my_dataframe earlier!'],
	['text', 'Voila! We\'re applying the "summary" function to a vector we subsetted from our dataframe!'],
 ['lesson_links', nil]
]
function_lesson = Lesson.create!(
  title: "Functions ()",
  project: project,
  lesson_id: 2,
)
data_access_slide_one = Slide.create!(
  content: function_main_content,
  parent: function_lesson,
  slide_id: 0,
)
################################################################################

plot_function_content_one = [
	['text', 'One of the important function we\'ll use in Anscombe is the plot() function.'],
	['text', 'As you may have guessed, it plots stuff!'],
	['text', 'So how do we use it? Well, ask for help!'],
	['code', 'help(plot)'],
	['text', 'Note that we omitted the "()" following plot(). This is the convention for help.'], #TODO give it pic
	['text', 'Usage gives us the specificiation of the function. Don\'t worry about the "(...)" for now.'],
	['text', 'It says to give it X and Y. Simple enough!'],
	['code', 'x_to_plot = c(1,2,3)'],
	['code', 'y_to_plot = c(1,2,3)'],
	['code', 'plot(x_to_plot, y_to_plot, main="first plot woot!")'],
]

plot_function_content_two = [
	['text', 'Our first plot!'],
	['text', 'Plot is our primary means of data vizualization.'],
	['text', 'Don\'t worry about the "main=" part, yet. (look in help() if you\'re curious).'],
	['text', 'Note that R also gives you the tilda (~) option in plotting.'],
	['code', 'plot(y_to_plot ~ x_to_plot, main="second plot yea!")'],
	['text', 'This plots "y_to_plot" against "x_to_plot". It produces the same plot as before! (with a changed title)'],
	['text', 'Congrats! Now you know how to plot simple graphs!'],
	['text', 'Remember that help(plot) will always give you examples at the bottom.'],
 ['next_steps', nil]
]
plot_function_step = Step.create!(
  title: "Plotting via plot()",
  lesson: function_lesson,
  step_id: 0,
)

plot_function_slide_one = Slide.create!(
  content: plot_function_content_one,
  parent: plot_function_step,
  slide_id: 0,
)
plot_function_slide_two = Slide.create!(
  content: plot_function_content_two,
  parent: plot_function_step,
  slide_id: 1,
)

################################################################################
summary_content_one = [
	['text', 'You\'re now finished with the Anscombe bootcamp.'],
	['text', 'You saw how to:'],
	['text', ' - create/compare/access vectors.'],
	['text', ' - create/access matrices.'],
	['text', ' - create/access/subset dataframes. (It\'s really similar to matrices!)'],
	['text', ' - understand the basics behind functions.'],
	['text', 'Don\'t worry if you don\'t yet fully grasp all the concepts.'],
	['text', 'You\'ll become more familair as you do the data projects. This bootcamp is just to get your feet wet.'],
	['text', 'You\'re now ready to take on Anscombe. Charge on!'],
	['feedback', 'http://www.surveygizmo.com/s3/1654603/Project-Feedback-Form'],
	['project_link', 'Back to the lessons page'],
]
summary_lesson = Lesson.create!(
  title: "Anscombe Bootcamp Summary",
  project: project,
  lesson_id: 3,
)

summary_slide_one = Slide.create!(
  content: summary_content_one,
  parent: summary_lesson,
  slide_id: 0,
)
################################################################################




