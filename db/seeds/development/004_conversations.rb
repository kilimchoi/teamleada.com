mark = User.find("mark")
tristan = User.find("tristan")
brian = User.find("brian")

convo1 = Conversation.where(starter: mark, title: "Best conversation").first_or_create
ConversationUser.where(user: mark, conversation: convo1, unread: true).first_or_create
ConversationUser.where(user: tristan, conversation: convo1, unread: true).first_or_create

message_from_mark = Message.create(user: mark, content: "This is the first of many many messages on leada", is_draft: false, conversation: convo1)
message_from_tristan = Message.create(user: tristan, content: "Reply back to mark on the same conversation", is_draft: false, conversation: convo1)

convo2 = Conversation.where(starter: mark, title: "2nd Best conversation").first_or_create
ConversationUser.where(user: mark, conversation: convo2, unread: true).first_or_create
ConversationUser.where(user: brian, conversation: convo2, unread: true).first_or_create

message_from_mark = Message.where(user: mark, content: "Messages are the funnest thing on leada i'm so glad they added this feature!", is_draft: false, conversation: convo2).first_or_create
message_from_brian = Message.where(user: brian, content: "Yo dawg I heard you are the shit", is_draft: false, conversation: convo2).first_or_create
