questions = [
  [
    "What is your name?",
    "This is a description for the question that asks a longer question and maybe even a more detailed question that is hopefully not redundant.",
    1,
  ],
  [
    "Where do you live?",
    "Hopefully users won't troll because moderating will not be fun for this. We will have to build in an admin panel that allows moderation.",
    2,
  ],
  [
    "What is your favorite color?",
    "These questions are really really bad.",
    3,
  ],
]

questions.each do |q|
  new_question = Question.create!(title: q[0], description: q[1], asker_id: q[2])
  puts "Created question: #{new_question.title}"
end
