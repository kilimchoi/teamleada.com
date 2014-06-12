metrics = [
  {
    uid: 0,
    model: "User",
    title: "All Users",
    method: "created_before?",
  },
  {
    uid: 1,
    model: "ProjectStatus",
    title: "Number of In Progress Projects",
    method: "created_before_and_not_completed?",
  },
  {
    uid: 2,
    model: "ProjectStatus",
    title: "Number of Completed Projects",
    method: "created_before_and_completed?",
  },
  {
    uid: 3,
    model: "ProjectStatus",
    title: "All Project Interactions",
    method: "created_before?",
  },
]


metrics.each do |metric_info|
  new_metric = Metric.where(uid: metric_info[:uid]).first_or_create!
  new_metric.update(
    model: metric_info[:model],
    title: metric_info[:title],
    method: metric_info[:method],
  )
  puts "Created metric: #{new_metric.title}"
end
