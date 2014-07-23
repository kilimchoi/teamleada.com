# Charts
sign_ups_chart = Chart.find(0)
users_by_type_chart = Chart.find(1)
project_interest_chart = Chart.find(2)
project_completion_chart = Chart.find(3)
invites_sent_chart = Chart.find(4)

# Metrics
all_users = Metric.find(0)
number_of_in_progress_projects = Metric.find(1)
number_of_completed_projects = Metric.find(2)
all_project_interactions = Metric.find(3)
users_with_project_access = Metric.find(4)
invited_users = Metric.find(5)
invites_sent = Metric.find(6)
linkedin_integration = Metric.find(7)
users_with_profile_photos = Metric.find(8)

# Chart Metrics
ChartMetric.where(chart: sign_ups_chart, metric: all_users).first_or_create!

ChartMetric.where(chart: users_by_type_chart, metric: all_users).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: users_with_project_access).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: invited_users).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: linkedin_integration).first_or_create!
ChartMetric.where(chart: users_by_type_chart, metric: users_with_profile_photos).first_or_create!

ChartMetric.where(chart: project_completion_chart, metric: number_of_in_progress_projects).first_or_create!
ChartMetric.where(chart: project_completion_chart, metric: number_of_completed_projects).first_or_create!
ChartMetric.where(chart: project_completion_chart, metric: all_project_interactions).first_or_create!

ChartMetric.where(chart: invites_sent_chart, metric: invited_users).first_or_create!
ChartMetric.where(chart: invites_sent_chart, metric: invites_sent).first_or_create!

puts "Finished creating ChartMetrics"
