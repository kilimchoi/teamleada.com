# Leaderboard Seed info for titanic
mark = User.find_by(username: 'mark')
brian = User.find_by(username: 'brian')
tristan = User.find_by(username: 'tristan')

project = Project.find_by(uid: 1)

ProjectScore.where(project: project, user: mark, score: 0.645).first_or_create
ProjectScore.where(project: project, user: brian, score: 0.600).first_or_create
ProjectScore.where(project: project, user: tristan, score: 0.712).first_or_create
