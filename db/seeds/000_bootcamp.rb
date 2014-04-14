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
  content: basic_operations_content,
  parent: basic_operations_lesson
)
################################################################################
basic_math_content_one = [
  ['text', 'Try the basic operations.'],
  ['code', '5 + 5'],
  ['text', 'What did you get? If you got 10, good!'],
  ['text', 'ry a few other to get a feel.'],
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
  title: "Mathematics 101",
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