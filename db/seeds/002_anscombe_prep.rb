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
data_object_content = [
  ['text', 'We\'ll be focusing on the following data obejcts'],
  ['lesson_links', nil]
]

data_object_lesson = Lesson.create!(
  title: "Different Data Objects",
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
  ['next_steps', nil]
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
  title: "Data One",
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




