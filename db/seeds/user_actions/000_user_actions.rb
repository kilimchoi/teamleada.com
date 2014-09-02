user_actions = [
  # Only add to the bottom, never remove and never change the order.
  "sign_up",
  "sign_in",
  "sign_out",
  "project_start",
  "project_completion",
  "user_edited_job_experience",
]

user_actions.each_with_index do |name, index|
  user_action = UserAction.where(name: name, uid: index).first_or_create
  puts "Created user_action called: #{name}."
end
