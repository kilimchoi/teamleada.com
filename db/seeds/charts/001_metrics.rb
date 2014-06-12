metrics = [
  {
    uid: 0,
    model: "User",
    title: "All Users",
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
