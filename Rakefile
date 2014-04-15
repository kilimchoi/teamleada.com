# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TeamLeada::Application.load_tasks

task :pull_blog do
  system("git submodule foreach git pull")
end

task :generate_blog do
  system("cd app/static/blog")
  system("jekyll build --destination public/blog")
end
