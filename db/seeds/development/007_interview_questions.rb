
best_restaurant = InterviewQuestion.create!(
  uid: 0,
  title: "Best Restaurant",
  difficulty_level: 9,
  question: "What is the best restaurant in Berkeley?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

best_restaurant.tag_list = "food, restaurants, berkeley"

best_boba = InterviewQuestion.create!(
  uid: 1,
  title: "Best Boba",
  difficulty_level: 10,
  question: "What is the best boba in Berkeley?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:multiple_choice],
)

best_boba.tag_list = "food, boba, berkeley"

best_band = InterviewQuestion.create!(
  uid: 2,
  title: "Best Band",
  difficulty_level: 5,
  question: "What is the best band ever?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:code],
)

best_band.tag_list = "bands, music, concerts"

