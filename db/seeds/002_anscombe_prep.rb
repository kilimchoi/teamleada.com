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
