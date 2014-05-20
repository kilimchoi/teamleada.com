users = [
  'mark',
  'brian',
  'tristan',
]

# Create admins
users.each do |user|
  email = "#{user}@#{user}.com"
  if User.find_by(email: email).nil?
    new_user = User.create(username: user, email: email, password: "password", role: 'admin')
    new_user.confirm!
    puts "Created user: #{new_user.username}."
  end
end

# Create students
(0..30).each do |index|
  username = "student#{index}"
  email = "#{username}@#{username}.com"
  if User.find_by(email: email).nil?
    new_user = User.create(username: username, email: email, password: "password", role: 'student')
    new_user.confirm!
    puts "Created user: #{new_user.username}."
  end
end
