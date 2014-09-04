

main_page_content = [
	['text', 'This is the test project to gauge interest of what kinds of projects our users want.'],

]

project = Project.create!(
  title:"A/B Testing Your Landing Page",
  description: main_page_content,
  short_description: "A data project based off of an eCommerce website attempting to A/B test their website to increase traffic and landing page engagement. In this project you will learn how to test experiment hypotheses and the statistical analyses required to interpret the results from your A/B test experiments.",
  number: 6,
  enabled: true,
  uid: 6,
  difficulty: 'Intermediate',
  category: Project::COMING_SOON,
  is_new: false,
  cover_photo: "ab-test",
)

################################################################################
puts "============ Created project: #{project.title}."
################################################################################
