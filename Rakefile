# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TeamLeada::Application.load_tasks

task :pull_blog do
  system("git submodule foreach git pull")
end

task :generate_blog do
  system("jekyll build --source app/static/blog --destination public/blog")
end

task :blog do
  Rake::Task["pull_blog"].execute
  Rake::Task["generate_blog"].execute
end

task default: [:blog]
