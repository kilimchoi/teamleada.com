
InterviewQuestion.where(
  uid: 0,
  title: "Best Restaurant",
  difficulty_level: 9,
  question: "What is the best restaurant in Berkeley",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
).first_or_create
