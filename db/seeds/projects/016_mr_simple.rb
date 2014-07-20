
main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

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


