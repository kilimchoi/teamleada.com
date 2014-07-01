users = [
  'mark',
  'brian',
  'tristan',
  'guang',
]

def create_users(usernames)
  usernames.each do |username|
    email = "#{username}@#{username}.com"
    if User.find_by(email: email, username: username).nil?
      new_user = User.create(username: username, email: email, password: "password", role: 'admin')
      new_user.confirm!
      puts "Created user: #{new_user.username}."
    end
  end
end

# Create admins
create_users(users)

# Create students
create_users((0..30).map{ |index| "student#{index}" })
