# Charts
sign_ups_chart = Chart.find(0)
users_by_type_chart = Chart.find(1)
project_interest_chart = Chart.find(2)
project_completion_chart = Chart.find(3)

# Metrics
all_users = Metric.find(0)
number_of_in_progress_projects = Metric.find(1)
number_of_completed_projects = Metric.find(2)

# Chart Metrics
ChartMetric.where(chart: sign_ups_chart, metric: all_users).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: all_users).first_or_create!
ChartMetric.where(chart: project_completion_chart, metric: number_of_in_progress_projects).first_or_create!
ChartMetric.where(chart: project_completion_chart, metric: number_of_completed_projects).first_or_create!

puts "Finished creating ChartMetrics"
