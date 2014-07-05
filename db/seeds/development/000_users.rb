admins = [
  ['Mark', 'Miyashita', 'mark@teamleada.com'],
  ['Brian', 'Liou', 'brian@teamleada.com'],
  ['Tristan', 'Tao', 'tristan@teamleada.com'],
]

students = (0..30).map{ |index| ["student#{index}", "student", "student#{index}@student.com"] }

def create_users(users_info, role)
  users_info.each do |user_info|
    first_name = user_info[0]
    last_name = user_info[1]
    email = user_info[2]
    if User.find_by(email: email, username: first_name.downcase).nil?
      new_user = User.create(username: first_name.downcase, email: email.downcase, password: "password", role: role, first_name: first_name, last_name: last_name)
      new_user.confirm!
      puts "Created user: #{new_user.username}."
    end
  end
end

# Create admins
create_users(admins, "admin")

# Create students
create_users(students, "student")
