# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TeamLeada::Application.load_tasks

from_the_beginning = Date.parse("26/3/2014")

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

# Charts
task :backfill_today => :environment do
  Metric.all.each do |metric|
    puts "Backfilling today for #{metric.title}"
    metric.backfill_today
  end
end

task :backfill_all => :environment do
  Metric.all.each do |metric|
    puts "Backfilling from the beginning for #{metric.title}"
    metric.backfill_to_today(from_the_beginning)
  end
end

task :backfill_yesterday => :environment do
  Metric.all.each do |metric|
    puts "Backfilling yesterday for #{metric.title}"
    metric.backfill_yesterday
  end
end

task :backfill_week => :environment do
  Metric.all.each do |metric|
    puts "Backfilling week for #{metric.title}"
    metric.backfill_week
  end
end

task :backfill_metric, [:metric] => :environment do |task, args|
  metric = Metric.where(title: args[:metric]).first
  if metric
    metric.backfill_to_today(from_the_beginning)
  end
end

# One off jobs
task :fill_end_date_present => :environment do
  JobExperience.all.each do |job_experience|
    job_experience.end_date_present = job_experience.end_date.nil?
    job_experience.save
  end
end

task default: [:blog]
