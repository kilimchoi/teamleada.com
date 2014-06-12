# Users
all_users = Metric.where(uid: 0).first_or_create!
all_users.update(
  model: "User",
  title: "All Users",
  method: "created_before?",
)
puts "Created metric: #{all_users.title}"


# Project Interest

