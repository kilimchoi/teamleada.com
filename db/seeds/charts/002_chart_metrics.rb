# Charts
sign_ups_chart = Chart.where(uid: 0)
users_by_type_chart = Chart.where(uid: 1)

# Metrics
all_users = Metric.where(uid: 0)

# Chart Metrics
ChartMetric.where(chart_id: sign_ups_chart, metric_id: all_users).first_or_create!
ChartMetric.where(chart_id: users_by_type_chart, metric_id: all_users).first_or_create!

puts "Finished making ChartMetrics"
