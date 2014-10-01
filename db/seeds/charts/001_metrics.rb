metrics = [
  {
    uid: 0,
    model: "User",
    title: "All Users",
    method: "created_before?",
    collection_method: "get_count",
  },
  {
    uid: 1,
    model: "ProjectStatus",
    title: "Number of In Progress Projects",
    method: "created_before_started_and_not_completed?",
    collection_method: "get_count",
  },
  {
    uid: 2,
    model: "ProjectStatus",
    title: "Number of Completed Projects",
    method: "created_before_and_completed?",
    collection_method: "get_count",
  },
  {
    uid: 3,
    model: "ProjectStatus",
    title: "All Project Interactions",
    method: "created_before_and_started?",
    collection_method: "get_count",
  },
  {
    uid: 4,
    model: "Code",
    title: "Users with project access",
    method: "num_users_with_project_access_created_before?",
    collection_method: "get_sum",
  },
  {
    uid: 5,
    model: "Invite",
    title: "Invited Users",
    method: "invited_user_created_before?",
    collection_method: "get_count",
  },
  {
    uid: 6,
    model: "Invite",
    title: "Invites Sent",
    method: "invite_sent_before?",
    collection_method: "get_count",
  },
  {
    uid: 7,
    model: "User",
    title: "LinkedIn Integrations",
    method: "linkedin_before?",
    collection_method: "get_count",
  },
  {
    uid: 8,
    model: "User",
    title: "Users with Profile Photos",
    method: "profile_photo_before?",
    collection_method: "get_count",
  },
  {
    uid: 9,
    model: "User",
    title: "Users with a Resume",
    method: "resume_uploaded_before?",
    collection_method: "get_count",
  },
]


metrics.each do |metric_info|
  new_metric = Metric.where(uid: metric_info[:uid]).first_or_create!
  new_metric.update(
    model: metric_info[:model],
    title: metric_info[:title],
    method: metric_info[:method],
    collection_method: metric_info[:collection_method],
  )
  puts "Created metric: #{new_metric.title}"
end
