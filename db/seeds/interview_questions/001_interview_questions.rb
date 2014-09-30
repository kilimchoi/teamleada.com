boy_or_girl = InterviewQuestion.create!(
  uid: 3,
  title: "Boy or Girl?",
  difficulty_level: 6,
  question: "In a family with 2 children, if you're told that one of the children is a girl, what is the probability that they're both girls?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:multiple_choice],
  multiple_choices: [
    "1/4",
    "1/3",
    "1/2",
    "3/4",
  ]
)
boy_or_girl.tag_list = "probability"

text_mining = InterviewQuestion.create!(
  uid: 4,
  title: "Text Mining",
  difficulty_level: 3,
  question: "What is an N-Gram in the context of text mining?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

text_mining.tag_list = "text-mining"

hadoop_0 = InterviewQuestion.create!(
  uid: 5,
  title: "Basic Stats with Hadoop",
  difficulty_level: 7,
  question: "How would you leverage Hadoop to find the median of 1 trillion numbers?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)

hadoop_0.tag_list = "Hadoop, MapReduce"

pca = InterviewQuestion.create!(
  uid: 6,
  title: "PCA",
  difficulty_level: 7,
  question: "How does Principle Component Analysis work, and how is it used?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)
pca.tag_list = "statistics"

brainteaser = InterviewQuestion.create!(
  uid: 7,
  title: "Brain Teaser",
  difficulty_level: 9,
  question: "Imagine that you're an ant starting at a vertex on a cube. If you begin embarking on a random walk to a different corner, what is the expected number of edges that you will traverse, before you've visited all the vertices? Briefly explain your reasoning as well.",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)
brainteaser.tag_list="brain-teaser"

classmates = InterviewQuestion.create!(
  uid: 8,
  title: "Classmates",
  difficulty_level: 8,
  question: "Say you're in a classroom with 50 people. Which of the following is the closest to the probability that there is another person with the same birthday as you?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
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
classmates.tag_list = "probability"

balls = InterviewQuestion.create!(
  uid: 9,
  title: "Balls",
  difficulty_level: 7,
  question: "There are 2 bags. One has 2 blue balls, the other has 1 blue and 1 yellow. You randomly pick a bag, followed by a random ball from that bag (without replacement). The ball is blue. What is the probability that the 2nd ball from the bag is also blue?",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)
balls.tag_list = "probability"

tradeoffs = InterviewQuestion.create!(
  uid: 10,
  title: "Trade-offs",
  difficulty_level: 7,
  question: "Explain the Bias-Variance tradeoff, and what that means for Data Scientists.",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)
tradeoffs.tag_list = "statistics"

assumptions = InterviewQuestion.create!(
  uid: 11,
  title: "Assumptions",
  difficulty_level: 7,
  question: "Explain the assumptions made under the Standard Linear Regression models.",
  posted_at: DateTime.parse("September 29, 2014 12:00:00 PM"),
  industry: InterviewQuestion.industries[:data_science],
  question_type: InterviewQuestion.question_types[:free_response],
)
assumptions.tag_list = "linear-models, statistics"
#question_type: InterviewQuestion.question_types[:multiple_choice],
