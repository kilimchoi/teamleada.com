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
  title: "Text Mining",
  difficulty_level: 3,
  question: "What is an N-Gram in the context of text mining?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 2,
  title: "Basic Stats with Hadoop",
  difficulty_level: 7,
  question: "How would you leverage Hadoop to find the median of 1 trillion numbers?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 3,
  title: "PCA",
  difficulty_level: 7,
  question: "How does Principle Component Analysis, and how is it used?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 4,
  title: "Brain Teaser",
  difficulty_level: 9,
  question: "Imagine you're an ant starting at a vertex on a cube. If you begin embarking on a random walk, what is the expected number of edges that you will taaverse, before you've visited all the vertices?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 5,
  title: "Classmates",
  difficulty_level: 8,
  question: "Say you're in a classroom with 50 people. Which of the following is the closest to the probability that there is another person with the same birthday as you?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:multiple_choice],
  multiple_choices: [
    "0.15",
    "0.35",
    "0.55",
    "0.75",
    "0.95",
]
)

InterviewQuestion.create!(
  uid: 6,
  title: "Balls",
  difficulty_level: 7,
  question: "There are 2 bags. One has 2 blue balls, the other has 1 blue, 1 yellow. You randomly pick a bag, and followed by a ball from the bag. The ball is blue. What is the probability that the 2nd ball from the bag is blue?",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 7,
  title: "Trade-offs",
  difficulty_level: 7,
  question: "Explain the Bias-Variance tradeoff, and what that means for Data Scientists.",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

InterviewQuestion.create!(
  uid: 8,
  title: "Assumptions",
  difficulty_level: 7,
  question: "Explain the assumptions made under the Standard Linear Regression models.",
  posted_at: DateTime.parse("September 23, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

#question_type: InterviewQuestion.question_types[:multiple_choice],
