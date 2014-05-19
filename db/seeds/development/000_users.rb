users = [
  'mark',
  'brian',
  'tristan',
]

# Create admins
users.each do |user|
  if User.find_by(username: user).nil?
    new_user = User.create(username: user, email: "#{user}@#{user}.com", password: "password", role: 'admin')
    puts "Created user: #{new_user.username}."
  end
end

# Create students
(0..10).each do |index|
  username = "student#{index}"
  if User.find_by(username: username).nil?
    new_user = User.create(username: username, email: "#{username}@#{username}.com", password: "password", role: 'student')
    puts "Created user: #{new_user.username}."
  end
end
