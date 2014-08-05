
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
]
intro_lesson = Lesson.create!(
  title: "Intro / Context",
  project: project,
  lesson_id: 0,
)

intro_slide_one = Slide.create!(
  parent: intro_lesson,
  content: main_page_content,
  slide_id: 0,
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


