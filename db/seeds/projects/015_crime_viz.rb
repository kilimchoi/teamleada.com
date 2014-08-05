
main_page_content = [
  ['text', 'In this project, you\'ll be building vizualization for a specific dataset.'],
  ['text', 'Namely the crime data from San Francisc, CA.'],
  ['text', 'You\'ll get the data from the official SF police website'],
  ['text', 'The project is rather open ended, and you can build whatever vizualization you want'],
  ['text-success', "Use your creativity!"],
]

project = Project.create!(
  title:"Vizualizing Crime Data",
  description: main_page_content,
  short_description: "A data project focused on vizualization and reporting. You'll be given a set of recent San Francisco crime data. You'll be reponsible for creating meaninful vizualizations and reporting your analysis.",
  number: 15,
  enabled: true,
  uid: 15,
  difficulty: 'Advanced',
  category: Project::CHALLENGE,
  is_new: true,
  deadline: 10.days,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

intro_content_one = [
  ['text-info', "You've just been hired by the SF city to better deal with its crime issues."],
  ['text', "First thing they want to do is to better understand crime pattern."],
  ['text', "You're tasked to create vizulizations that will help the city interpret the crime."],
  ['text', "You're not given a specific plot/chart speficiation, and you must come up with your own analysis."],
  ['text', "The crime data can be downloaded below."],
  ['link', "ttps://data.sfgov.org/Public-Safety/SFPD-Incidents-Previous-Three-Months/tmnf-yvry?"],
  ['text', "How many months of data do you get back?"],
  ['quiz', "crime_viz_0"],
]

intro_content_two = [
  ['text-info', "The data contains geographic area, as well as crime types."],
  ['text', "As mentioned before, the type of vizualization is entirely up to you."],
  ['text-warning', "You might want to consider creatings plots that encompasses the following:"],
  ['text', " - Time the crime occured"],
  ['text', " - Geo-Location of the crime"],
  ['text', " - Type of the crime occured"],
  ['text', " - And more!"],
  ['text-success', "Make sure to explain in your report why you chose to create the vizualization you created."],
]

intro_content_three = [
  ['text', "Lastly, you're free to complete the project in any language/framework you like."],
]

quiz = Quiz.create!(
  quiz_id: "crime_viz_0",
  answer:"3",
)

intro_lesson = Lesson.create!(
  title: "Intro / Context",
  project: project,
  lesson_id: 0,
)

intro_slide_one = Slide.create!(
  parent: intro_lesson,
  content: intro_content_one,
  slide_id: 0,
)
intro_slide_two = Slide.create!(
  parent: intro_lesson,
  content: intro_content_two,
  slide_id: 1,
)

intro_slide_thre = Slide.create!(
  parent: intro_lesson,
  content: intro_content_three,
  slide_id: 2,
)

################################################################################
##### Code Submission ##########################################################
################################################################################

code_submission_lesson = Lesson.create!(
  title: "Code Submission",
  project: project,
  lesson_id: 1,
)

################################################################################
##### Reoport Submission #######################################################
################################################################################

report_submission_lesson = Lesson.create!(
  title: "Report Submission",
  project: project,
  lesson_id: 2,
)


################################################################################
##### Conclusion ###############################################################
################################################################################


