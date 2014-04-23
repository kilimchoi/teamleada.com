# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  'mark',
  'brian',
  'tristan',
]

users.each do |user|
  if User.find_by(username: user).nil?
    new_user = User.create(username: user, email: "#{user}@#{user}.com", password: "password")
    puts "Created user: #{new_user.username}."
  end
end

# Delete all current projects
Project.destroy_all

# Loads seed files from db/seeds
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  puts "Seeding #{seed}."
  load seed
end
