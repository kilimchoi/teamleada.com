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

task :migrate_to_user_profile => :environment do
  User.all.each do |user|
    profile = user.profile
    profile.looking_for_opportunities = user.read_attribute(:looking_for_opportunities)
    profile.location = user.read_attribute(:location)
    profile.bio = user.read_attribute(:bio)
    profile.phone = user.read_attribute(:phone)
    profile.headline = user.read_attribute(:headline)
    profile.industry = user.read_attribute(:industry)
    profile.date_of_birth = user.read_attribute(:date_of_birth)
    profile.interests = user.read_attribute(:interests)
    profile.job_bookmarks_count = user.read_attribute(:job_bookmarks_count)
    profile.country_code = user.read_attribute(:country_code)
    profile.save
  end
end

task :migrate_to_user_preferences => :environment do
  User.all.each do |user|
    preferences = user.preferences
    preferences.who_can_see_profile = user.read_attribute(:who_can_see_profile)
    preferences.who_can_send_friend_requests = user.read_attribute(:who_can_send_friend_requests)
    preferences.who_can_contact = user.read_attribute(:who_can_contact)
    preferences.who_can_lookup_using_email = user.read_attribute(:who_can_lookup_using_email)
    preferences.who_can_lookup_by_name = user.read_attribute(:who_can_lookup_by_name)
    preferences.who_can_see_resume = user.read_attribute(:who_can_see_resume)
    preferences.wants_email_about_new_projects = user.read_attribute(:wants_email_about_new_projects)
    preferences.wants_email_from_recruiters = user.read_attribute(:wants_email_from_recruiters)
    preferences.save
  end
end

task :create_user_signed_up_stories => :environment do
  User.all.each do |user|
    unless UserSignedUpStory.exists?(subject: user, action_object: user)
      signed_up_story = user.create_signed_up_story
      signed_up_story.created_at = user.created_at
      signed_up_story.updated_at = user.created_at
      signed_up_story.save
    end
  end
end

task :create_project_stories => :environment do
  ProjectStatus.all.each do |project_status|
    started_story = project_status.create_user_started_project_story
    started_story.created_at = project_status.created_at
    started_story.updated_at = project_status.created_at
    started_story.save

    if project_status.completed
      ended_story = project_status.create_user_completed_project_story
      ended_story.created_at = project_status.updated_at
      ended_story.updated_at = project_status.updated_at
      ended_story.save
    end
  end
end

task :create_project_interest_stories => :environment do
  ProjectInterest.all.each do |project_interest|
    interest_story = project_interest.create_user_project_interest_story
    interest_story.created_at = project_interest.created_at
    interest_story.updated_at = project_interest.created_at
    interest_story.save
  end
end

task :presentation_submission_contexts => :environment do
  SubmissionContext.where(submission_type: SubmissionContext::PRESENTATION_SLIDES_LINK).each do |submission_context|
    submission_context.project_submissions.each do |project_submission|
      content_object = project_submission.content_object
      new_content_object = SlidesLinkSubmissionContent.create(
        content: content_object.content,
      )
      project_submission.content_object = new_content_object
      project_submission.save
      content_object.delete
    end
  end

  SubmissionContext.where(submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK).each do |submission_context|
    submission_context.project_submissions.each do |project_submission|
      content_object = project_submission.content_object
      new_content_object = VideoLinkSubmissionContent.create(
        content: content_object.content,
      )
      project_submission.content_object = new_content_object
      project_submission.save
      content_object.delete
    end
  end
end

task :delete_old_quiz_submissions => :environment do
  quiz_submissions = QuizSubmissionContent.all.select{ |quiz| (155..400).include? quiz.quiz_id.to_i }
  quiz_submissions.each do |quiz_submission|
    quiz_submission.delete
  end
  puts "Deleted #{quiz_submissions.count} quiz submissions with incorrect quiz_ids."
end

task :build_quiz_submissions => :environment do
  QuizSubmissionContent.all.each do |quiz_submission_content|
    user = quiz_submission_content.user
    quiz = quiz_submission_content.quiz_via_id
    project = quiz.project
    slide = quiz.slide
    content_object = quiz_submission_content

    project_submission = ProjectSubmission.create_with_user_project_slide_content_object(user, project, slide, content_object)
    project_submission.updated_at = quiz_submission_content.updated_at
    project_submission.created_at = quiz_submission_content.created_at
    project_submission.save
  end
end

task :create_initial_companies => :environment do
  puts "Creating initial companies"
  load File.join(Rails.root, 'db', 'seeds', 'development', '006_companies.rb')
end
