# Leaderboard Seed info for titanie
mark = User.find_by(username: 'mark')
brian = User.find_by(username: 'brian')
tristan = User.find_by(username: 'tristan')

project = Project.find_by(uid: 1)

Submission.create!(project: project, user: mark, score: 0.645)
Submission.create!(project: project, user: brian, score: 0.600)
Submission.create!(project: project, user: tristan, score: 0.712)
