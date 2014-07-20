
main_page_content = [
  ['text', "In this project, you'll design and build a mapreduce algorithm to traverse graph data."],
  ['text', "Graph is a powerful data structure that is used in the following cases:"],
  ['text', "- Social Data"],
  ['text', "- Road Networks"],
  ['text', "- Biological Networks"],
  ['text', "- Web Networks"],
  ['text', "Often times, the graph data mentioned above can't be properly analyze via a single computer (Can you think of why?)."],
  ['text', "Come in distributed system such as Hadoop to help."],
  ['text', "Here, we'll be doing simple graph traversal via mapreduce to understand the power/limitation of distributed computing."],
]

project = Project.create!(
  title:"Graph Traversal via Hadoop MapRduce",
  description: main_page_content,
  short_description: "We'll do a Graph Traversal via MapRduce. You'll be given a set of graph data to traverse. In the process, you'll choose the graph representation, the algorithm, and more. Once you design the code, you can optionally write a functional MapRduce code.",
  number: 16,
  enabled: true,
  uid: 16,
  difficulty: 'Expert',
  category: Project::CHALLENGE,
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################

project_overview_content0 = [
  ['text', "In this project, you'll design and build a mapreduce algorithm to traverse graph data."],
  ['text', "Graph is a powerful data structure that is used in the following cases:"],
  ['text', "- Social Data"],
  ['text', "- Road Networks"],
  ['text', "- Biological Networks"],
  ['text', "- Web Networks"],
  ['text', "Often times, the graph data mentioned above can't be properly analyze via a single computer (Can you think of why?)."],
  ['text', "Come in distributed system such as Hadoop to help."],
  ['text', "Here, we'll be doing simple graph traversal via mapreduce to understand the power/limitation of distributed computing."],
  ['next_steps', nil],
]

project_overview = Lesson.create!(
  title: "Project Overview",
  project: project,
  lesson_id: 0,
)

project_overview_slide0 = Slide.create!(
  content: project_overview_content0,
  parent: project_overview,
  slide_id: 0,
)

################################################################################
####### Overview ###############################################################
################################################################################

setup_main_slide = [
  ['text', "Before we dive into writing mapreduce code, we have to decide a few things."],
  ['lesson_links', ""],
]

project_overview_lesson = Lesson.create!(
  title: "Algorithm / Setup",
  project: project,
  lesson_id: 1,
)

setup_slide_main_one = Slide.create!(
  content: setup_main_slide,
  parent: project_overview_lesson,
  slide_id: 0,
)

################################################################################
data_representation_content_one = [
  ['text', "Before we do anything, we have to decide on the data repsentation."],
  ['text', "There are different ways to repsentat graph data. below are some resource on graph data representation"],
  ['link', ""],
  ['text', "Given the context, what kind of representation do you plan to use?"],
  ['user_response', "@TODO leave response ID here"],
  ['next_steps', ""],
]

data_representation_step_one = Step.create!(
  title: "Graph Representation",
  step_id: 0,
  lesson: project_overview_lesson,
)

data_representatino_slide_one = Slide.create!(
  content: data_representation_content_one,
  slide_id: 0,
  parent: data_representation_step_one
)

data_represent_submission = SubmissionContext.create!(
  title: "Graph Data Representation",
  description: "User is asked to explain what kind of graph data representation he/she plans to use",
  slide: data_representatino_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################

algorithm_content_one = [
  ['text', "There are many different ways to find the shortest distance."],
  ['text', "Don't quite worry about writing mapreduce code yet"],
  ['text', "Describe the algorithm you plan to employ in finding the shotest path"],
  ['text', "Why this particular algorithm? What are the strength/weakness/shortfall? Scalability?"],
  ['user_response', "@TODO probably a submission id"],
  ['next_steps'],
]

algorithm_step = Step.create!(
  title: "Algorithm",
  step_id: 1,
  lesson: project_overview_lesson
)

algorithm_slide = Slide.create!(
  content: algorithm_content_one,
  slide_id: 0,
  parent: algorithm_step
)

algorithm_design_submission = SubmissionContext.create!(
  title: "Traversal Algorithm",
  description: "User is asked to explain the algorithm he/she chose to utilize for the traversal.",
  slide: algorithm_slide,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
####### Mapper Lesson ##########################################################
################################################################################

project_overview = Lesson.create!(
  title: "Mapper",
  project: project,
  lesson_id: 2,
)
################################################################################
project_overview = Lesson.create!(
  title: "Sort / Shuffle",
  project: project,
  lesson_id: 3,
)

################################################################################
project_overview = Lesson.create!(
  title: "Reducer",
  project: project,
  lesson_id: 4,
)

################################################################################

project_overview = Lesson.create!(
  title: "Conclusion",
  project: project,
  lesson_id: 5,
)

################################################################################

