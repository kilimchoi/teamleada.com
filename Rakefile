# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TeamLeada::Application.load_tasks

task :pull_blog do
  system("git submodule foreach git pull")
end

task :generate_blog do
  system("jekyll build --source app/static/blog --destination app/compiled/blog")
end

task :blog do
  Rake::Task["pull_blog"].execute
  Rake::Task["generate_blog"].execute
end

task :user_defaults => :environment do
  User.all.each do |u|
    u.updated_password_at = u.created_at
    u.set_privacy_preferences
    u.save(validate: false)
  end
end

task :backfill_all => :environment do
  Metric.all.each do |metric|
    metric.backfill_to_today(100.days.ago)
  end
end

task default: [:blog]
