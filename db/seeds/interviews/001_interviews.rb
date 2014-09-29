InterviewQuestion.create!(
  uid: 0,
  title: "Boy or Girl?",
  difficulty_level: 6,
  question: "In a family with 2 children, if you're told that one of the children is a girl, what is the probability that they're both girls?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 1,
  title: "Best Boba",
  difficulty_level: 10,
  question: "What is the best boba in Berkeley?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:multiple_choice],
)

InterviewQuestion.create!(
  uid: 2,
  title: "Best Band",
  difficulty_level: 5,
  question: "What is the best band ever?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:code],
)
