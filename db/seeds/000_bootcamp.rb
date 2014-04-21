# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'This bootcamp is for first time R users and first time programmers. If you have programming experience the topics in this bootcamp may be too basic for you.'],
  ['text', 'If you are a first time user, make sure you have also watched our "Onboarding R/RStudio Video"'],
  ['text', 'We\'re using the language R, while using the IDE (interactive development environment) of RStudio. RStudio is basically software which provides an easier interface to using R.'],
  ['text', 'R is a language designed with the users in mind. Many people find it easy to use and inuitive.'],
  ['text', 'Happy Learning!']
]

project = Project.create!(
  title: "R Bootcamp",
  description: main_page_content,
  number: 0,
  enabled: true
)

################################################################################
puts "Created project: #{project.title}."
################################################################################
################################################################################
#@TODO INCLUDE ONBOARDING VIDEO ON RSTUDIO.

##Intro to Basics.
basic_operations_content_one = [
  ['text', 'We\'ll first start with some elementary operations in R.'],
  ['text', 'In it\'s simplest form, think of R simply as an extremely sophisticated Calculator.'],
  ['lesson_links', nil]
]

basic_operations_lesson = Lesson.create!(
  title: "Basic Expressions",
  project: project
)

basic_operations_slide_one = Slide.create!(
  content: basic_operations_content_one,
  parent: basic_operations_lesson
)
################################################################################
basic_math_content_one = [
  ['text', 'Try the basic operations.'],
  ['code', '5 + 5'],
  ['text', 'What did you get? If you got 10, good!'],
  ['text', 'try a few other to get a feel.'],
  ['code', '1 - 10'],
  ['code', '12 + 178'],
  ['next_steps', nil]
]
basic_math_content_two = [
  ['text', 'Instead of addition, we can easily do other operations by simply using a different operator!'],
  ['code', '12 * 2'],
  ['code', '6/2'],
  ['code', '(-3) + 2'],
  ['text', 'The same mathematical rule applies when it comes to order of operations. Try the following and see what you get!'],
  ['code', '10 + 5 / 5'],
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
  ['text', 'If we want to save some numbers that we can refer to later, we do a variable assignement.'],
  ['text', 'Assignment happens with either an equal sign "=" (more traditional), or with an arrow, \'<-\':'],
  ['text', 'we\'ll generally use the "=" sign.'],
  ['code', 'orange = 3.5'],
  ['code', 'grape = 4.0'],
  ['code', 'melon = 5.0'],
  ['code', 'cake = 10.0'],
  ['code', 'five = 5'],
  ['code', 'broccoli = -5'],
  ['next_steps', nil]
]
basic_assignment_content_two = [
  ['text', 'You can also store words or phrases, more commonly known as characters or strings in programming, with a double quote.'],
  ['text', 'You can also use single quotes, but we\'ll stick with double for now'],
  ['code', 'greeting = "Hello World!"'],
  ['code', 'personal_statement = "I hate broccoli!"'],
  ['code', 'favorite_motorcycle = "Ducati"'],
  ['next_steps', nil]
]
basic_assignment_content_three = [
  ['text', 'At anytime, you can return the value of those variables by entering it in the Console.'],
  ['code', 'broccoli'],
  ['code', 'orange'],
  ['code', 'melon'],
  ['code', 'favorite_motorcycle'],
  ['text', 'You can also explicitly ask R to print the value of the variables by using the print() method.'],
  ['text', 'We\'ll cover methods/function in more details, but for now trust us and try!'],
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
  ['text', 'Now that we have integers or character/strings assigned to variables, we can compare them using logical comparisons.'],
  ['text', 'The possible logical comparisons you can use in R and programming more generally are:'],
  ['text', 'A greater than B : \'A > B\''],
  ['text', 'A grater than or equal to B : \'B >= A\''],
  ['text', 'A smaller than B : \'A < B\''],
  ['text', 'A smaller than B : \'A <= B\''],
  ['text', 'A is equal to B : \'A == B\' Note that we have TWO equal signs here!'],
  ['next_steps', nil]
]
basic_comparison_content_two = [
  ['text', 'Let\'s see if we can compare some of the variables we assigned above. We can do the following comparisons:'],
  ['text', 'Note that what R returns, TRUE or FALSE values, are known as Boolean/Logical data types and this is a different data type from integers, characters, or strings'],
  ['text', 'Now let\'s try it out.'],
  ['code', 'melon <= orange'],
  ['code', 'grape == five'],
  ['code', 'favorite_motorcycle == "Yamaha"'],
  ['code', 'favorite_motorcycle == "Ducati"'],
  ['text', 'These comparisons shape the backbone of modern programming.'],
  ['text', 'The boolean data types in R are TRUE, FALSE, T, or F. Note that if you write it in undercase it errors. Also note that the boolean data type in R defaults to the integer values. FALSE defaults to 0 and TRUE defaults to 1'],
  ['code', 'true'],
  ['text', 'That should have returned an error in R'],
  ['code', 'T + 1'],
  ['code', 'FALSE == 0'],
  ['text', 'T + 1 should return 2 and FALSE == 0 should return TRUE'],
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
################################################################################
################################################################################
##Combining Intro Concepts
combined_operations_content_one = [
  ['text', 'Let\'s now do some operations and recap what we\'ve done!'],
  ['code', 'melon_cake = melon + cake'],
  ['code', 'melon_cake'],
  ['text', 'What about this?'],
  ['code', 'evil_cake = broccoli + cake'],
  ['code', 'evil_cake'],
  ['text', 'Cool, huh?'],
  ['lesson_links', nil]
]
combined_operations_content_two = [
  ['text', 'What about characters/strings? Do they all work?'],
  ['code', 'print (personal_statement)'],
  ['code', 'print (personal_statement + " But, " + favorite_motorcycle) #Uh oh, does this work? ;)'],
  ['text', 'What happened? It helps to read the error (printed in red).'],
  ['text', 'It seems scary, but if we read the error, it says "non-numeric argument to binary operator".'],
  ['text', 'R is telling you that you can\'t apply the "+" operator to non-numeric (such as characters/strings) data.'],
  ['text', 'How do we get around this? The following will work, but it is just a sneak preview! We\'ll learn more later.'],
  ['code', 'print (paste(personal_statement, favorite_motorcycle, sep=" But, I love "))'],
  ['project_link', 'Back to the lessons page'],
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
  ['text', 'Every time you store a variablbe via an assignment, you\'re storing a specific class.'],
  ['text', 'R also has five data types: scalars, vectors, matrices, data frames, and lists. We will only go over scalars and vectors in this lesson.'],
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
  ['text', 'Scalars are the most basic values in R and can be of three classes that you have already been using: integers, characters, and logicals. Verify the classes of objects with the class() function.'],
  ['code', 'orange'],
  ['code', 'class(orange)'],
  ['code', 'favorite_motorcycle'],
  ['code', 'class(favorite_motorcycle)'],
  ['code', 'class(TRUE)'],
  ['code', 'class(cake > broccoli) #remember what the comparison yielded?'],
  ['project_link', 'Back to the lessons page']
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
  ['text', 'We now have an idea of the most elementary values in R. What if we want to store multiple values?'],
  ['text', 'We do this in R by creating vectors'],
  ['text', 'Vectors are the way in which R stores a single dimension of data'],
  ['text', 'Let\'s try it.'],
  ['next_steps', nil]
]
vectors_content_two = [
  ['text', 'we\'ll start by creating a simple vector and using the c() function in R. Think of it as the "concatenate" function.'],
  ['code', 'number_list = c(1,2,3,4)'],
  ['code', 'words_list = c("I", "hate", "vegetables")'],
  ['text', 'Make sure to have commas, or it will error out. Try and see what error you get!'],
  ['code', 'food_opinion = c("I", "hate" "vegetables")'],
  ['text', 'Can you intepret the message?'],
  ['text', 'It\'s telling us that it was expecting something other than a string(word) constant in the command (i.e. it wants a comma)']
]
vectors_content_three = [
  ['text', 'Note that if you mix and match classes in R, entries will generally get converted into Character/String type.'],
  ['code', 'Note that quotes around the values indicates that they\'ve been converted into Character type.'],
  ['code', 'c("I", "once", "ate", 1, "vegetable")'],
  ['code', 'c("there", "is", 1, TRUE, "winner")'],
  ['text', 'Getting familar with error messages will help you become better faster. We promise.'],
  ['text', 'Check out the help function to learn more.'],
  ['text', 'We encourage you to use help() to learn about functions. We\'re not always going to be around to tell you everything!'],
  ['code', 'c'],
  ['code', 'help(c)']
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
  ['text', 'In this onboard to R bootcamp, we taught you how to write basic expressions in R and the basis of data types in the R language.'],
  ['text', 'You can now do basic arithmetic in R in addition to some data manipulation.'],
  ['text', 'Now, we\'re going to throw you into project specific tutorials. Get ready.'],
  ['project_link', 'Back to the lessons page']
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






























