charts = [
  {
    uid: 0,
    category: "users",
    title: "Sign ups on Leada over time",
    y_axis_label: "Total number of sign ups",
  },
  {
    uid: 1,
    category: "users",
    title: "Number of users by type over time",
    y_axis_label: "Total number of users",
  },
  {
    uid: 2,
    category: "projects",
    title: "Project Interest",
    y_axis_label: "Total number of interest in specific projects",
  },
  {
    uid: 3,
    category: "projects",
    title: "Project Completion over time",
    y_axis_label: "Total number of projects",
  },
]

charts.each do |chart_info|
  new_chart = Chart.where(uid: chart_info[:uid]).first_or_create!
  new_chart.update(
    category: chart_info[:category],
    title: chart_info[:title],
    y_axis_label: chart_info[:y_axis_label],
  )
  puts "Created chart: #{new_chart.title}"
end
