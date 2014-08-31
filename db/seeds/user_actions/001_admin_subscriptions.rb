admin_subscriber = Subscriber.where(name: "admin").first_or_create
puts "Created singleton admin subscriber"

UserAction.all.each do |user_action|
  Subscription.where(subscriber: admin_subscriber, subscribable: user_action).first_or_create
  puts "Subscribed admins to: #{user_action.name}"
end
