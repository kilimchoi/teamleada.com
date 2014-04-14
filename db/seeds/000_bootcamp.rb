# Creates the anscombe project on the site!
#Main Page
main_page_content = [
  ['text', 'We\'ll be going over some basic R operations here.'],
  ['text', 'We\'re technically using the language R, while using the IDE (interactive development environment) of RStudio'],
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
  ['text', 'We\'ll first start with some elementary data operations'],
  ['text', 'This involves multiplying numbers. Remember, R is simply an extremely sophisticated Calculator.'],
  ['lesson_links', nil]
]

basic_operations_lesson = Lesson.create!(
  title: "Basic Operations",
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
  ['text', 'The same mathematical rule applies when it comes to order of operations. Try the followinga and see what you get!'],
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
  ['text', 'You can also store assigns words/pharses (or more formally "Character/String") with a double quote.'],
  ['text', 'You can also use single quotes, but we\'ll stick with double for now'],
  ['code', 'greeting = "Hello World!"'],
  ['code', 'personal_statement = "I hate broccolis!"'],
  ['code', 'favorite_motorcycle = "Ducati"'],
  ['next_steps', nil]
]
basic_assignment_content_three = [
  ['text', 'At anytime, you can print the numbers by entering it in the Console.'],
  ['code', 'broccoli'],
  ['code', 'orange'],
  ['code', 'melon'],
  ['code', 'favorite_motorcycle'],
  ['text', 'You can also explicitly ask R to print by using the print() method.'],
  ['text', 'Well cover methods/function in more details, but for now trust us and try!'],
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
  ['text', 'Now that we have numbers assigned to variables, we can compare the numbers.'],
  ['text', 'Let\'s see if we can compare some of the variables we assigned above. We can do the followign comparisons:'],
  ['text', 'Note that what get\'s returned (TRUE or FALSE) are known as Boolean/Logical data types.'],
  ['text', 'A greater than B : \'A > B\''],
  ['text', 'A grater than or equal to B : \'B >= A\''],
  ['text', 'A smaller than B : \'A < B\''],
  ['text', 'A smaller than B : \'A <= B\''],
  ['text', 'A is equal to B : \'A == B\' Note that we have TWO equal signs here!'],
  ['next_steps', nil]
]
basic_comparison_content_two = [
  ['text', 'Now let\'s try it out.'],
  ['code', 'melon <= orange'],
  ['code', 'grape == five'],
  ['code', 'cake > -10'],
  ['code', 'broccoli < 0.0'],
  ['code', 'favorite_motorcycle == "Yamaha"'],
  ['code', 'favorite_motorcycle == "Ducati"'],
  ['text', 'Believe it or not, these comparisons shape the backbone of modern programming.'],
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
  ['text', 'What about words/Strings? Do they all work?'],
  ['code', 'print (personal_statement)'],
  ['code', 'print (personal_statement + " But, " + favorite_motorcycle) #Uh oh, does this work? ;)'],
  ['text', 'What happened? It helps to read the error (printed in read).'],
  ['text', 'It seems scary, but if we read the error, it says "non-numeric argument to binary operator".'],
  ['text', 'R is telling you that you can\'t apply the "+" operator to non-numric (such as string/words) data.'],
  ['text', 'How do we get around this? The following will work, but it is just a sneak preview! We\'ll learn more later.'],
  ['code', 'print (paste(personal_statement ,favorite_motorcycle, sep=" But, I love "))'],
  ['project_link', 'Back to the lessons page'],
]

combined_operations_lesson = Lesson.create!(
  title: "Basic Operations",
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
  ['text', 'Now that we know how to do "stuff" in R, let\'s end this tutorial by going over one last concept: Data Types.'],
  ['text', 'Every time you store a variablbe via an assignment, you\'re storing a specific Data Type.'],
  ['text', 'Each of these datatypes belong to a class.'],
  ['']
  ['lesson_links', nil]
]
datatypes_lesson = Lesson.create!(
  title: "Data Types",
  project: project
)
basic_operations_slide_one = Slide.create!(
  content: datatypes_intro_content_one,
  parent: basic_operations_lesson
)
################################################################################
classes_content_one = [
  ['text', 'We saw numbers, strings, true/falses and more. Let\'s inspect by printing the variable and checking its type.'],
  ['code', 'orange'],
  ['code', 'class(orange)'],
  ['code', 'favorite_motorcycle'],
  ['code', 'class(favorite_motorcycle)'],
  ['code', 'class(TRUE)'],
  ['code', 'class(cake > broccoli) #remember what the comparison yielded?'],
  ['text', 'You don\'t have to remember or understand all the datatype; for we simply ask that you remember they exist.']
  ['text', 'but what other data object exists?']
  ['next_steps', nil]
]
classes_content_step = Step.create!(
  title: "Classes 101",
  lesson: basic_operations_lesson
)
classes_slide_one = Slide.create!(
  content: classes_content_one,
  parent: classes_content_step
)
################################################################################
vectors_content_one = [
  ['text', 'We saw numbers, strings, true/falses and more. Let\'s inspect by printing the variable and checking its type.'],
  ['code', 'orange'],
  ['code', 'class(orange)'],
  ['code', 'favorite_motorcycle'],
  ['code', 'class(favorite_motorcycle)'],
  ['code', 'class(TRUE)'],
  ['code', 'class(cake > broccoli) #remember what the comparison yielded?'],
  ['text', 'You don\'t have to remember or understand all the datatype; for we simply ask that you remember they exist.']
  ['text', 'but what other data object exists?']
  ['next_steps', nil]
]
vectors_content_step = Step.create!(
  title: "Vectors 101",
  lesson: basic_operations_lesson
)
vectors_slide_one = Slide.create!(
  content: vectors_content_one,
  parent: classes_content_step
)











