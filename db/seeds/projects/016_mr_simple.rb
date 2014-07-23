
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
  title: "Background / Algorithm",
  project: project,
  lesson_id: 1,
)

setup_slide_main_one = Slide.create!(
  content: setup_main_slide,
  parent: project_overview_lesson,
  slide_id: 0,
)

# https://s3.amazonaws.com/leada/amazon_proj_data/amazon0601.txt.gz

################################################################################

background_content_one = [
  ['text', "Imagine you're working for a leading E-Commerce giant in creating tools to help with product recommendation."],
  ['text', "The first thing you decide to do is to build a simple system that determines the distance between 2 products."],
  ['text', "You ask yourself, how do you determine the 'distance' between 2 products?"],
  ['text', "After consulting with fellow engineers, you decide on using the network distance between the products that were bought during the same transaction."],
  ['text', "This means an edge exists between 2 products, if they were purchased during the same transaction."],
  ['text', "To save on memory footprint, you sample an anonymized graph dataset. below:"],
  ['link', "https://s3.amazonaws.com/leada/amazon_proj_data/amazon0601.txt.gz"],
  ['text', "Link to the product entity is as follows:"],
  ['link_invalid', "some link"],
]

background_content_two = [
  ['text', "With amazon0601.txt, you have a list of directed edges, each representing a co-purchase."],
  ['text', "How many Nodes are there in the data?"],
  ['quiz', "mr_data_node_count"],
  ['text', "How many Edges are there in the data?"],
  ['quiz', "mr_data_edge_count"],
  ['next_steps', ""],
]

quiz = Quiz.create!(
  quiz_id: "mr_data_edge_count",
  answer: "3387388",
)

quiz = Quiz.create!(
  quiz_id: "mr_data_node_count",
  answer: "403394",
)

background_step_one = Step.create!(
  title: "MapReduce Amazon Data Background",
  step_id: 0,
  lesson: project_overview_lesson,
)

background_slide_one = Slide.create!(
  content: background_content_one,
  slide_id: 0,
  parent: background_step_one
)

background_slide_two = Slide.create!(
  content: background_content_two,
  slide_id: 1,
  parent: background_step_one
)
################################################################################

data_representation_content_one = [
  ['text', "Before we do anything, we have to decide on the data repsentation."],
  ['text', "There are different ways to repsentat graph data. below are some resources on graph data representation"],
  ['link', "http://www.geeksforgeeks.org/graph-and-its-representations/"],
  ['text', "Given the context, what kind of representation do you plan to use, and why?"],
  ['user_response', "@TODO leave response ID here"],
  ['next_steps', ""],
]

data_representation_step_one = Step.create!(
  title: "Graph Representation",
  step_id: 1,
  lesson: project_overview_lesson,
)

data_representation_slide_one = Slide.create!(
  content: data_representation_content_one,
  slide_id: 0,
  parent: data_representation_step_one
)

data_represent_submission = SubmissionContext.create!(
  title: "Graph Data Representation",
  description: "User is asked to explain what kind of graph data representation he/she plans to use.",
  slide: data_representation_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################

algorithm_content_one = [
  ['text', "There are many different ways to find the shortest distance."],
  ['text', "Don't quite worry about writing mapreduce code yet."],
  ['text', "Describe the algorithm you plan to employ in finding the shotest path."],
  ['text', "Why this particular algorithm? What are the strength/weakness/shortfall? Scalability?"],
  ['user_response', "@TODO probably/prefebly a submission id"],
  ['next_steps'],
]

algorithm_step = Step.create!(
  title: "Algorithm",
  step_id: 2,
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

mapper_main_content_one = [
  ['text', "Now that we've decided on an algorithm, let's think about what kind of mapper we'd need to accomplish the task."],
  ['text', "Here is some resource on MapReduce as a refresher."],
  ['link', "http://map-reduce.wikispaces.asu.edu/"],
  ['lesson_links', ""],
]

mapper_lesson = Lesson.create!(
  title: "Mapper",
  project: project,
  lesson_id: 2,
)

mapper_main_slide = Slide.create(
  content: mapper_main_content_one,
  slide_id: 0,
  parent: mapper_lesson
)

################################################################################

mapper_input_content_one = [
  ['text', "Mappers generally have a fixed input type."],
  ['text', "This is the input you can expect your mappers to intake the graph data."],
  ['text', "What kind of input do you expect your mapper to have?"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

mapper_input_step = Step.create!(
  title: "Mapper Input",
  step_id: 0,
  lesson: mapper_lesson
)

mapper_input_slide_one = Slide.create!(
  content: mapper_input_content_one,
  slide_id: 0,
  parent: mapper_input_step,
)

mapper_input_submission = SubmissionContext.create!(
  title: "Mapper Input",
  description: "User is asked to explain the input to the mapper.",
  slide: mapper_input_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
################################################################################
mapper_function_content_one = [
  ['text', "Now we can think more about what our mappers are actually going to do."]
  ['text', "Describe in more details about what our mappers are going to do;"],
  ['text', "What is the main function of your mapper?"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

mapper_function_step = Step.create!(
  title: "Mapper Function",
  step_id: 1,
  lesson: mapper_lesson
)

mapper_function_slide_one = Slide.create!(
  content: mapper_function_content_one,
  slide_id: 0,
  parent: mapper_function_step,
)

mapper_function_submission = SubmissionContext.create!(
  title: "Mapper Function",
  description: "User is asked to explain the what the Mapper's primary function will be.",
  slide: mapper_function_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)
################################################################################
mapper_output_content_one = [
  ['text', "Lastly, you have to worry about what your mapper will output."],
  ['text', "Keep in mind that the mapper output will eventually end up as the input to the reducer."],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

mapper_output_step = Step.create!(
  title: "Mapper Output",
  step_id: 2,
  lesson: mapper_lesson
)

mapper_output_slide_one = Slide.create!(
  content: mapper_output_content_one,
  slide_id: 0,
  parent: mapper_output_step,
)

mapper_output_submission = SubmissionContext.create!(
  title: "Mapper Output",
  description: "User is asked to explain the what the Mapper's primary output will be.",
  slide: mapper_output_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
####### Reducer Lesson #########################################################
################################################################################

reducer_lesson = Lesson.create!(
  title: "Reducer",
  project: project,
  lesson_id: 3,
)

reducer_main_content_one = [
  ['text', "We have a working mapper. Naturally we're going to look at the reducer next."],
  ['text', "Here is another MapReduce resource, this time focusing more on application:"],
  ['link', "http://highlyscalable.wordpress.com/2012/02/01/mapreduce-patterns/#attachment_287"],

  ['lesson_links', ""],
]

reducer_main_slide = Slide.create(
  content: reducer_main_content_one,
  slide_id: 0,
  parent: reducer_lesson
)

################################################################################

reducer_input_content_one = [
  ['text', "Reducer inputs are a list of values grouped by their output key from the Mapper output."],
  ['text', "What kind of input do you expect your reducer to have, given the Mapper you designed earlier?"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

reducer_input_step = Step.create!(
  title: "Reducer Input",
  step_id: 0,
  lesson: reducer_lesson
)

reducer_input_slide_one = Slide.create!(
  content: reducer_input_content_one,
  slide_id: 0,
  parent: reducer_input_step,
)

reducer_input_submission = SubmissionContext.create!(
  title: "reducer Input",
  description: "User is asked to explain the input to the reducer.",
  slide: reducer_input_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################

reducer_function_content_one = [
  ['text', "What is the main function of your reducer?"],
  ['text', "Describe in a paragraph what your reducer is going to accomplish"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

reducer_function_step = Step.create!(
  title: "Reducer Function",
  step_id: 1,
  lesson: reducer_lesson
)

reducer_function_slide_one = Slide.create!(
  content: reducer_function_content_one,
  slide_id: 0,
  parent: reducer_function_step,
)

reducer_function_submission = SubmissionContext.create!(
  title: "Reducer Function",
  description: "User is asked to explain the what the reducer's primary function will be.",
  slide: reducer_function_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
reducer_output_content_one = [
  ['text', "Lastly, you have to worry about what your reducer will output."],
  ['text', "Keep in mind that the reducer output will eventually be re-fed into the mapper."],
  ['text', "You don't have to worry about the looping yet, we'll design the iteration in the next section"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

reducer_output_step = Step.create!(
  title: "Reducer Output",
  step_id: 2,
  lesson: reducer_lesson
)

reducer_output_slide_one = Slide.create!(
  content: reducer_output_content_one,
  slide_id: 0,
  parent: reducer_output_step,
)

reducer_output_submission = SubmissionContext.create!(
  title: "Reducer Output",
  description: "User is asked to explain the what the reducer's primary output will be.",
  slide: reducer_output_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
####### Iteration Lesson #######################################################
################################################################################

iteration_lesson = Lesson.create!(
  title: "Iteration / Stop Criterion",
  project: project,
  lesson_id: 4,
)

iteration_main_content_one = [
  ['text', "Now that we've setup both the mapper and the iteration, we can worry about iterating."],
  ['text', "The algorithm will continue to run until a specific stop Criterion"],
  ['lesson_links', ""],
]

iteration_main_slide = Slide.create(
  content: iteration_main_content_one,
  slide_id: 0,
  parent: iteration_lesson
)

################################################################################

iteration_iterate_content_one = [
  ['text', "Since we have a set mapper and reducer, how do you plan on iterating the algorithm?"],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

iteration_iterate_step = Step.create!(
  title: "Iteration",
  step_id: 0,
  lesson: iteration_lesson
)

iteration_iterate_slide_one = Slide.create!(
  content: iteration_iterate_content_one,
  slide_id: 0,
  parent: iteration_iterate_step,
)

iteration_iterate_submission = SubmissionContext.create!(
  title: "Interation Explanation",
  description: "User is asked to explain how the algorithm is going to iterate.",
  slide: iteration_iterate_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################

stop_criterion_content_one = [
  ['text', "The last thing we have to worry about is the termination."],
  ['text', "What is your termination criterion?"],
  ['text', "Explain how you know the termination criteria is optimal."],
  ['user_response', "@TODO response_id if applicable"],
  ['next_steps', ""],
]

stop_criterion_step = Step.create!(
  title: "Stop Criterion",
  step_id: 1,
  lesson: iteration_lesson
)

stop_criterion_slide_one = Slide.create!(
  content: stop_criterion_content_one,
  slide_id: 0,
  parent: stop_criterion_step,
)

stop_criterion_submission = SubmissionContext.create!(
  title: "Stop Criterion Explanation",
  description: "User is asked to explain how the algorithm is going to terminate.",
  slide: stop_criterion_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::RESPONSE,
)

################################################################################
####### Iteration Lesson #######################################################
################################################################################

conclusion_lesson = Lesson.create!(
  title: "Conclusion",
  project: project,
  lesson_id: 5,
)

conclusion_main_content_one = [
  ['text', "Now we have the whole project structured."],
  ['text', "You're ready to write the code for mapreduce"],
  ['text', "Once you have the complete code, paste the src code below"],
  ['user_code', ""],
]

conclusion_main_content_two = [
  ['text', "In this project, we started with a thinking about graph data representation."],
  ['text', "From there, we designed Mappers, Reducers, and ultimately iterations and termination."],
  ['text', "Now try running the data G"],
]

conclusion_main_content_three = [
  ['text', ""],
]

conclusion_main_slide_one = Slide.create(
  content: conclusion_main_content_one,
  slide_id: 0,
  parent: conclusion_lesson
)

conclusion_main_slide_two = Slide.create(
  content: conclusion_main_content_two,
  slide_id: 1,
  parent: conclusion_lesson
)

#conclusion_main_slide_three = Slide.create(
#  content: conclusion_main_content_three,
#  slide_id: 2,
#  parent: conclusion_lesson
#)

src_code_submission = SubmissionContext.create!(
  title: "MapReduce SRC code",
  description: "User is asked to input the final src code submission for MapReduce.",
  slide: conclusion_main_slide_one,
  submission_context_id: 0,
  submission_type: SubmissionContext::CODE,
)
################################################################################

