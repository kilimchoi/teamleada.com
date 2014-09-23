
InterviewQuestion.create!(
  uid: 0,
  title: "Best Restaurant",
  difficulty_level: 9,
  question: "What is the best restaurant in Berkeley",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 1,
  title: "Best Boba",
  difficulty_level: 10,
  question: "What is the best boba in Berkeley",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:multiple_choice],
)
