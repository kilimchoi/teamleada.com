if Rails.env.development?
  (0..5).each do |index|
    username = "student#{index}"
    if User.find_by(username: username).nil?
      new_user = User.create(username: username, email: "#{username}@#{username}.com", password: "password", role: 'student')
      puts "Created user: #{new_user.username}."
    end
  end
end
