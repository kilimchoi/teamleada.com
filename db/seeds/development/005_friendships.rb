mark = User.find("mark")
tristan = User.find("tristan")
brian = User.find("brian")

friendship1 = Friendship.where(user: mark, friend: tristan, status: Friendship::ACCEPTED, requested: true).first_or_create
friendship2 = Friendship.where(user: brian, friend: mark, status: Friendship::ACCEPTED, requested: true).first_or_create
friendship3 = Friendship.where(user: tristan, friend: brian, status: Friendship::ACCEPTED, requested: true).first_or_create

puts "Created friendships between the founders."

