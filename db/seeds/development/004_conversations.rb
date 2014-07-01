mark = User.find("mark")
tristan = User.find("tristan")
brian = User.find("brian")

convo1 = Conversation.where(starter: mark, title: "Best conversation").first_or_create
ConversationUser.where(user: mark, conversation: convo1, unread: true).first_or_create
ConversationUser.where(user: tristan, conversation: convo1, unread: true).first_or_create

message_from_mark = Message.create(user: mark, content: "This is the first of many many messages on leada", is_draft: false, conversation: convo1)
message_from_tristan = Message.create(user: tristan, content: "Reply back to mark on the same conversation", is_draft: false, conversation: convo1)
