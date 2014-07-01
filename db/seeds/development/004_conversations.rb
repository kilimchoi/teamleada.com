mark = User.find("mark")
tristan = User.find("tristan")
brian = User.find("brian")

convo1 = Conversation.create(starter: mark, title: "Best conversation")
convo1.users << mark
convo1.users << tristan
