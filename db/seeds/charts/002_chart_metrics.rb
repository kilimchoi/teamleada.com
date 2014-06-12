# Charts
sign_ups_chart = Chart.find(0)
users_by_type_chart = Chart.find(1)
project_interest_chart = Chart.find(2)

# Metrics
all_users = Metric.find(0)

# Chart Metrics
ChartMetric.where(chart: sign_ups_chart, metric: all_users).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: all_users).first_or_create!

puts "Finished creating ChartMetrics"
