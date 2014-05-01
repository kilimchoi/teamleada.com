# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'This tutorials is for first time R users and first time programmers. If you have programming experience the topics in this bootcamp may be too basic for you.'],
  ['text', 'If you are a first time user, make sure you have also watched our "Onboarding R/RStudio Video" as you will need to have R and RStudio installed in your own computer to follow along.'],
  ['video', 'OXdcpbDSzxU'],
  ['text', 'Happy Learning!']
]

project = Project.create!(
  title: "Introduction to R",
  description: main_page_content,
  number: 0,
  enabled: true
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
################################################################################


tutorial_introduction_content = [
  ['text', 'We\'re using the language R, while using the IDE (interactive development environment) of RStudio. RStudio is software which provides an easier interface to using R.'],
  ['text', 'You should open up Rstudio in your own computer and use our web application on a different screen to follow along.'],
  ['text', 'Use the right arrow key to output text with explanations and R code. We will introduce you to the basic functionalities of the R programming language in this tutorial.'],
  ['text', 'R has becomeo the most popular programming language for data scientists and data analysts in industry today. Specifically for statistical analysis and visualization of data, R is the most effective language to use.'],
  ['text', 'Another benefit is that its completely open source and has a large community of developers contributing new libraries and functionalities everyday!'],
]

tutorial_introduction_lesson = Lesson.create!(
  title: "Tutorial Introduction",
  project: project,
)

tutorial_introduction_slide = Slide.create!(
  content: tutorial_introduction_content,
  parent: tutorial_introduction_lesson,
)
########################################################################################################

##Intro to Basics.
basic_operations_content_one = [
  ['text', 'We\'ll first start with some elementary operations in R.'],
  ['text', 'In it\'s simplest form, think of R simply as an extremely sophisticated Calculator.'],
  ['lesson_links', nil]
]

basic_operations_lesson = Lesson.create!(
  title: "Basic Expressions",
  project: project,
)

basic_operations_slide_one = Slide.create!(
  content: basic_operations_content_one,
  parent: basic_operations_lesson,
)
################################################################################
basic_math_content_one = [
  ['text', 'Let us first try the most basic operations'],
  ['code', '5 + 5'],
  ['text', 'Enter what you got below:'],
  ['quiz', 'onboard_1'],
  ['text', 'You can also use functions built in R such as sqrt() or abs() to do mathematical operations'],
  ['code', 'sqrt(16)'],
  ['code', 'abs(-100)'],
  ['next_steps', nil]
]
basic_math_content_two = [
  ['text', 'The same mathematical rules apply when it comes to order of operations. Try the following and see what you get!'],
  ['code', '10 + 5 / 5'],
  ['quiz', 'onboard_2'],
  ['next_steps', nil]
]
basic_math_step = Step.create!(
  title: "Mathematics 101",
  lesson: basic_operations_lesson
)
basic_math_slide_one = Slide.create!(
  content: basic_math_content_one,
  parent: basic_math_step
)

basic_math_slide_two = Slide.create!(
  content: basic_math_content_two,
  parent: basic_math_step
)
################################################################################
basic_assignment_content_one = [
  ['text', 'If we want to store values that we can refer to later, we do a variable assignement.'],
  ['text', 'Assignment happens with either an equal sign "=" (more traditional), or with an arrow, "<-".'],
  ['text', 'We\'ll generally use the "=" sign. Run the following lines to save some variables for us to work with.'],
  ['code', 'orange = 3.5'],
  ['code', 'grape = 4.0'],
  ['code', 'melon = 5.0'],
  ['code', 'cake = 10.0'],
  ['code', 'five = 5'],
  ['code', 'broccoli = -5'],
  ['text', 'Now we can refer back to those numbers later via their assignements'],
  ['next_steps', nil]
]
basic_assignment_content_two = [
  ['text', 'You can also store words, more commonly known as strings, with double quotes.'],
  ['code', 'greeting = "Hello World!"'],
  ['code', 'personal_statement = "I hate broccoli!"'],
  ['code', 'favorite_motorcycle = "Ducati"'],
  ['text', 'Just as before, the variables are stored to their assigned values and are immediately ready to use.'],
  ['next_steps', nil]
]
basic_assignment_content_three = [
  ['text', 'At anytime, you can return the value of those variables by typing directly in your console or writing in your Rscript.'],
  ['code', 'broccoli'],
  ['code', 'orange'],
  ['code', 'melon'],
  ['code', 'favorite_motorcycle'],
  ['text', 'You can also explicitly ask R to print the values of the variables by using the print() method.'],
  ['code', 'print (broccoli)'],
  ['code', 'print (favorite_motorcycle)'],
  ['next_steps', nil]
]
basic_assignment_step = Step.create!(
  title: "Variable Assignment 101",
  lesson: basic_operations_lesson
)
basic_assignment_slide_one = Slide.create!(
  content: basic_assignment_content_one,
  parent: basic_assignment_step
)
basic_assignment_slide_two = Slide.create!(
  content: basic_assignment_content_two,
  parent: basic_assignment_step
)
basic_assignment_slide_two = Slide.create!(
  content: basic_assignment_content_three,
  parent: basic_assignment_step
)
################################################################################
basic_comparison_content_one = [
  ['text', 'Now that we have numbers and strings assigned to variables, we can compare them using logical comparators.'],
  ['text', 'The available logical comparators in R (and programming in general) are:'],
  ['text', 'A greater than B : "A > B"'],
  ['text', 'A greater than or equal to B : "B >= A"'],
  ['text', 'A smaller than B : "A < B"'],
  ['text', 'A smaller than or equal to B : "A <= B"'],
  ['text', 'A is equal to B : "A == B": Note that we have TWO equal signs here!'],
  ['text', 'Let\'s see if we can compare some of the variables we assigned above. We can do the following comparisons:'],
  ['text', 'Note that TRUE or FALSE in R is known as Boolean/Logical data types. This is a different data type from numbers or strings'],
  ['next_steps', nil]
]
basic_comparison_content_two = [
  ['text', 'Try out the following comparisons and see what they return'],
  ['code', 'melon <= orange'],
  ['code', 'grape == five'],
  ['code', 'favorite_motorcycle == "Yamaha"'],
  ['code', 'favorite_motorcycle == "Ducati"'],
  ['text', 'These comparisons shape the backbone of modern programming.'],
  ['text', 'The only boolean data types in R are TRUE and FALSE; if you write it in lowercase R will not recognize the data type. Also note that the boolean data types in R defaults to integer values. FALSE defaults to 0 and TRUE defaults to 1'],
  ['text', 'The following code should return an error in R'],
  ['code', 'true'],
  ['next_steps', nil],
]
basic_comparison_content_three = [
  ['text', 'What does the following code return?'],
  ['code', 'TRUE + 1'],
  ['quiz', 'onboard_3'],
  ['text', 'What does the following code return?'],
  ['code', 'FALSE == 0'],
  ['quiz', 'onboard_4'],
  ['text', 'Remember that we\'re comparing numbers via "==" and assinging via "="'],
  ['next_steps', nil]
]
basic_comparison_step = Step.create!(
  title: "Comparison 101",
  lesson: basic_operations_lesson
)
basic_math_slide_one = Slide.create!(
  content: basic_comparison_content_one,
  parent: basic_comparison_step
)

basic_math_slide_two = Slide.create!(
  content: basic_comparison_content_two,
  parent: basic_comparison_step
)

basic_math_slide_three = Slide.create!(
  content: basic_comparison_content_three,
  parent: basic_comparison_step
)
################################################################################
################################################################################
##Combining Intro Concepts
combined_operations_content_one = [
  ['text', 'To write down code in your Rscript that you don\'t want Rstudio to run just put a # before it. This is called adding "comments" to your code.'],
  ['text', 'Let\'s now do some operations and recap what we\'ve done!'],
  ['code', 'melon_cake = melon + cake'],
  ['code', 'melon_cake'],
  ['text', 'Verify how code comments work by typing the code below:'],
  ['code', '#melon_cake, see this code doesn\'t return a value'],
  ['lesson_links', nil]
]
combined_operations_content_two = [
  ['text', 'What about characters/strings? Do they all work?'],
  ['code', 'print (personal_statement)'],
  ['code', 'print (personal_statement + " But, " + favorite_motorcycle) #Uh oh, does this work?'],
  ['text', 'What happened? It helps to read the error (printed in red).'],
  ['text', 'If we read the error, it says "non-numeric argument to binary operator".'],
  ['text', 'R is telling us that we can\'t apply the "+" operator to non-numeric (such as characters or strings) data.'],
  ['text', 'How do we get around this? The following will work, but it is just a sneak preview! We\'ll learn more later.'],
  ['code', 'print (paste(personal_statement, favorite_motorcycle, sep=" But, I love "))'],
]

combined_operations_lesson = Lesson.create!(
  title: "Combined Expressions",
  project: project
)

combined_operations_slide_one = Slide.create!(
  content: combined_operations_content_one,
  parent: combined_operations_lesson
)
combined_operations_slide_one = Slide.create!(
  content: combined_operations_content_two,
  parent: combined_operations_lesson
)
################################################################################
################################################################################
##Intro to DataTypes
datatypes_intro_content_one = [
  ['text', 'Now that we know how to write basic expressions in R, let\'s end this tutorial by going over one last concept: data types.'],
  ['text', 'Every time you store a variable via an assignment, you\'re storing a specific data type.'],
  ['text', 'The 5 most common data types in R are: scalars, vectors, matrices, data frames, and lists. We will go over scalars and vectors in this lesson.'],
  ['lesson_links', nil]
]
datatypes_lesson = Lesson.create!(
  title: "Data Types",
  project: project
)
basic_operations_slide_one = Slide.create!(
  content: datatypes_intro_content_one,
  parent: datatypes_lesson
)
################################################################################
scalars_content_one = [
  ['text', 'Scalars are the most basic values in R: integers, characters, and logicals. You can verify the classes of the objects with the class() function.'],
  ['code', 'orange'],
  ['code', 'class(orange)'],
  ['code', 'favorite_motorcycle'],
  ['code', 'class(favorite_motorcycle)'],
  ['code', 'class(TRUE)'],
  ['code', 'class(cake > broccoli) #remember what the comparison yielded?'],
]
scalars_content_step = Step.create!(
  title: "Scalars 101",
  lesson: datatypes_lesson
)
scalars_slide_one = Slide.create!(
  content: scalars_content_one,
  parent: scalars_content_step
)
################################################################################
vectors_content_one = [
  ['text', 'We now know how to store single values in R. But what if we want to store multiple values?'],
  ['text', 'We do this in R by creating vectors.'],
  ['text', 'Vectors are the way in which R stores multiple 1-dimensional data points'],
  ['text', 'Note that Vectors are NOT the same as Lists.'],
  ['next_steps', nil]
]
vectors_content_two = [
  ['text', 'We\'ll start by creating a simple vector and using the c() function in R. Think of the c as short for a "concatenate" function.'],
  ['code', 'number_list = c(1,2,3,4)'],
  ['code', 'words_list = c("I", "hate", "vegetables")'],
  ['text', 'Make sure to have commas, or it will error out. Try and see what error you get!'],
  ['code', 'food_opinion = c("I", "hate" "vegetables")'],
  ['text', 'Can you intepret the error message?'],
  ['text', 'It\'s telling us that it was expecting something other than a string(word) constant in the command (i.e. it requires a comma)']
]
vectors_content_three = [
  ['text', 'Note that if you create a vector with different data types in R such as strings and numbers, entries will generally get converted into Character/String type.'],
  ['text', 'Note that quotes around the values indicates that they\'ve been converted into Character/String type.'],
  ['code', 'c("I", "once", "ate", 1, "vegetable")'],
  ['text', 'Getting familar with error messages will help you become better faster.'],
  ['text', 'Check out the help function to learn more about the various functions in R.'],
  ['code', 'help(c)'],
]
vectors_content_step = Step.create!(
  title: "Vectors 101",
  lesson: datatypes_lesson
)
vectors_slide_one = Slide.create!(
  content: vectors_content_one,
  parent: vectors_content_step
)
vectors_slide_two = Slide.create!(
  content: vectors_content_two,
  parent: vectors_content_step
)
vectors_slide_three = Slide.create!(
  content: vectors_content_three,
  parent: vectors_content_step
)

################################################################################
################################################################################
##Intro to DataTypes
conclusion_content_one = [
  ['text', 'In this R bootcamp, we taught you how to write basic expressions in R as well as the basics of data types in the R language.'],
  ['text', 'You can now do basic arithmetic in R in addition to some data manipulation.'],
  ['text', 'Use the skills and knowledge here to start completing data projects.'],
  ['project_link', 'Back to the Project main page']
]
conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  project: project
)
basic_operations_slide_one = Slide.create!(
  content: conclusion_content_one,
  parent: conclusion_lesson
)
################################################################################
