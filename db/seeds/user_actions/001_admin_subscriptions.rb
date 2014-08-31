
UserAction.all.each do |user_action|
  Subscription.where(subscriber_type: "admin", subscribable: user_action).first_or_create
  puts "Subscribed admins to: #{user_action.name}"
end
