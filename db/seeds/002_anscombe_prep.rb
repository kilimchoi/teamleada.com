# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'This quick intro will get you through project Anscombe (ahns-kohm-bees).'],
  ['text', 'Majority of what we\'ll cover in this quick intro is functions and more data types.'],
  ['text', 'knowing the different data types is important, because it holds data.'],
  ['text', 'Ultimately if you\'re working with data, thee most important concept is accessing and storing data.']
  ['text', 'Happy Learning!']
]

project = Project.create!(
  title: "Anscombe Bootcamp",
  description: main_page_content,
  number: 2,
  enabled: true
)

################################################################################
puts "Created project: #{project.title}."
################################################################################
################################################################################
#Create
data_object_content = [
  ['text', 'We\'ll be focusing on creating following data obejcts'],
  ['lesson_links', nil]
]

data_object_lesson = Lesson.create!(
  title: "Creating Different Data Objects",
  project: project
)

data_object_slide_one = Slide.create!(
  content: data_object_content,
  parent: data_object_lesson
)
################################################################################
vector_data_content_one = [
  ['text', 'Previously way we saw how to store data in a vector.'],
  ['code', 'vector_one = c(1,2,3,4,5,6)'],
  ['code', 'vector_one'],
  ['text', 'To access data in the vector, simply indicate which location (or index) you want to see.'],
  ['text', 'Unlike most programming languages, R starts indexing at 1 instead o 0!'],
  ['code', 'vector_one[1]'],
  ['code', 'vector_one[4]'],
  ['text', 'what about invalid requests?'],
  ['code', 'vector_one[0]'],
  ['code', 'vector_one[10]'],
]
vector_data_content_two = [
  ['text', 'Note that you con consider the vector as a matrix vector.'],
  ['code', 'This means you can apply elementary oeprations via scalar operations, as shown below.'],
  ['code', 'bigger_vector = vector_one * 5'],
  ['code', 'bigger_vector'],
  ['code', 'bigger_vector == vector_one #remember that '=' assigns values, whereas '==' compares them.'],
  ['text', 'This means vector wise comparison works too!'],
  ['code', 'bigger_vector == (vector_one * 5)'],
  ['code', 'bigger_vector - vector_one'],
  ['code', 'class(bigger_vector)'],
  ['text', 'Keep in mind that we\'re not assigning the result from the operations above;'],
  ['text', 'this means the values are printed, and then lost. All most reeasons for us to use data types to save them!'],
  ['next_steps', nil]
]

vector_data_step = Step.create!(
  title: "Vectors",
  lesson: data_object_lesson
)

vector_data_slide_one = Slide.create!(
  content: vector_data_content_one,
  parent: vector_data_step
)
vector_data_slide_one = Slide.create!(
  content: vector_data_content_two,
  parent: vector_data_step
)
################################################################################

matrix_data_content_one = [
	['text' ,'A natural extension of a single vector/vector is the Matrix.'],
	['code','row_wise = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=2, ncol=3, byrow = TRUE)'],
	['code','col_wise = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=2, ncol=3, byrow = FALSE)'],
	['code','row_wise'],
	['code','col_wise'],
	['code','class(col_wise)'],
	['text','Can you guess how this works?'],
	['text','we feed it the vector data via "data=" option.'],
	['text','we\'ll tell it how many rows and columns via "nrow=" and "ncol=" option.'],
	['text','byrow specifies the order in which we populate the matrix row-wise or column-wise.'],
]
matrix_data_content_two = [
	['text', 'what about a mal-formed requests? Try it! We encourage you to try weird things. Who knows, it might work ;)'],
	['text', 'We try to create a 10 by 10 matrx below, while only giving it 6 data points. What happens?'],
	['code', 'weird_matrix = matrix(data=c(3, 4, 5, 6, 7, 8), nrow=10, ncol=10, byrow = TRUE)'],
	['text', 'You get a warning message. But did it work? YES! R tries to create the matrix.'],
	['text', 'It does so by repeating the data you specified enough times (last repetition is partial) to fill the matrix.'],
	['text', '(this isn\'t recommended until you\'re more familiar with R)'],
	['code', 'weird_matrix'],
	['text', 'Wherelse could you have gotten that information?'],
	['code', 'help(matrix)'],
	['text', 'WOAH! It offers the same information we just imparted. It also has useful examples at the very bottom.'],
	['text', 'help is always there if you need it.'],
]

matrix_data_step = Step.create!(
  title: "Matrix",
  lesson: data_object_lesson
)

matrix_data_slide_one = Slide.create!(
  content: matrix_data_content_one,
  parent: matrix_data_step
)
matrix_data_slide_one = Slide.create!(
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
	['text', 'One thing to note is that the dataframe (can) contain different kinds of data (numbers, words/strings, logicals)'],
	['code', 'my_dataframe'],
	['code', 'class(my_dataframe)'],
]

dataframe_data_content_two = [
	['code', 'names(my_dataframe)'],
	['text', 'With the name() function, we were able to acess the column names of the entries.'],
	['text', 'We can access the columns via the "$" operator. You\'ll get used to this notation soon.'],
	['code', 'my_dataframe$my_logicals'],
	['code', 'class(my_dataframe$my_logicals)'],
	['text', 'You can also access columns as we did before, via column index, starting at 1'],
	['code', 'my_dataframe[1]'],
	['code', 'my_dataframe[2]'],
	['text', 'For now, this isn\'t recommended so we won\'t be using this until you\'re more comfortable with R.'],
]
dataframe_data_step = Step.create!(
  title: "Data Frame",
  lesson: data_object_lesson
)

dataframe_data_slide_one = Slide.create!(
  content: dataframe_data_content_one,
  parent: dataframe_data_step
)
dataframe_data_slide_one = Slide.create!(
  content: dataframe_data_content_two,
  parent: dataframe_data_step
)
################################################################################
################################################################################
#Access
data_access_content = [
  ['text', 'Now that we saw how to create the data accesss, we\'ll see how to access them here.'],
  ['lesson_links', nil]
]

data_access_lesson = Lesson.create!(
  title: "Accessing Data accesss",
  project: project
)

data_access_slide_one = Slide.create!(
  content: data_access_content,
  parent: data_access_lesson
)
################################################################################

matrix_access_content_one = [
	['text', 'Now to access the data we stored. You can specifiy which data point to access by specifying the row and col numbers.'],
	['code', 'test_matrix = matrix(c(1,2,3,4, 5, 6), nrow=3, ncol=2)'],
	['code', 'test_matrix[1,1]'],
	['code', 'test_matrix[1,10]'],
	['code', 'test_matrix[1,100]'],
	['code', 'test_matrix[1,1000]'],
	['text', 'Does this work?'],
]

matrix_access_content_two = [
	['text', 'What if you only have one of the numbers? Try it!'],
	['text', 'Do you see a difference between commas and no commas?'],
	['code', 'test_matrix'],
	['code', 'test_matrix[2]'],
	['code', 'test_matrix[2,]'],
	['code', 'test_matrix[,2]'],
	['text', 'Play around, you should notice a specific behavior.'],
]

matrix_access_step = Step.create!(
  title: "Accessing Matrix",
  lesson: data_object_lesson
)

matrix_access_slide_one = Slide.create!(
  content: matrix_access_content_one,
  parent: matrix_access_step
)
matrix_access_slide_one = Slide.create!(
  content: matrix_access_content_two,
  parent: matrix_access_step
)
################################################################################






dataframe_data_content_two = [
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
	['', ''],
]





