# Users
sign_ups_chart = Chart.where(uid: 0).first_or_create!
sign_ups_chart.update(
  category: "users",
  title: "Sign ups on Leada over time",
  y_axis_label: "Total number of sign ups",
)
puts "Created chart: #{sign_ups_chart.title}"

user_types_chart = Chart.where(uid: 1).first_or_create!
user_types_chart.update(
  category: "users",
  title: "Number of users by type over time",
  y_axis_label: "Total number of users",
)
puts "Created chart: #{user_types_chart.title}"


# Projects
project_interest_chart = Chart.where(uid: 2).first_or_create!
project_interest_chart.update(
  category: "projects",
  title: "Project Interest",
  y_axis_label: "Total number of interest in specific projects",
)
puts "Created chart: #{project_interest_chart.title}"
