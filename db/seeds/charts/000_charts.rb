from_the_beginning = Date.parse("26/3/2014")
invites_enabled = Date.parse("23/6/2014")
one_month = 30.days.ago

charts = [
  {
    uid: 0,
    category: "users",
    title: "Sign ups on Leada over time",
    y_axis_label: "Total number of sign ups",
    default_timeframe: from_the_beginning,
  },
  {
    uid: 1,
    category: "users",
    title: "Number of users by type over time",
    y_axis_label: "Total number of users",
    default_timeframe: from_the_beginning,
  },
  {
    uid: 2,
    category: "projects",
    title: "Project Interest",
    y_axis_label: "Total number of interest in specific projects",
    default_timeframe: one_month,
  },
  {
    uid: 3,
    category: "projects",
    title: "Project Completion over time",
    y_axis_label: "Total number of projects",
    default_timeframe: from_the_beginning,
  },
  {
    uid: 4,
    category: "invites",
    title: "Invites Sent over time",
    y_axis_label: "Total Invites sent out",
    default_timeframe: invites_enabled,
  },
]

charts.each do |chart_info|
  new_chart = Chart.where(uid: chart_info[:uid]).first_or_create!
  new_chart.update(
    category: chart_info[:category],
    title: chart_info[:title],
    y_axis_label: chart_info[:y_axis_label],
    default_timeframe: chart_info[:default_timeframe],
  )
  puts "Created chart: #{new_chart.title}"
end
