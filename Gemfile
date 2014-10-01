source "https://rubygems.org"
ruby "2.1.2"

gem "rails", "4.1.4"

gem "byebug", "3.1.2"
gem "nokogiri", "1.6.1"
gem "tilt", "1.4.1"
gem "sass-rails", "~> 4.0.2"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails", "~> 3.1.1"
gem "jquery-ui-rails", "~> 4.2.1"
gem "bootstrap-sass", "~> 3.1.1"
gem "font-awesome-rails"
gem "uglifier", ">= 1.3.0"
gem "slim-rails", "~> 2.1.3"
gem "animate-rails"
gem "sprockets", "2.11.0"
gem "pg", "0.17.1"
gem "jbuilder", "~> 1.2"
gem "devise", "~> 3.2.3"
gem "simple_form", "~> 3.1.0.rc2"
gem "rails-reveal-js", "~> 2.6.1.2"
gem "rails-rename", "~> 1.0.0"
gem "cancancan", "~> 1.7"
gem "friendly_id", "~> 5.0.3"
gem "stripe", git: "https://github.com/stripe/stripe-ruby"
gem "will_paginate", "~> 3.0"
gem "bootstrap-will_paginate"
gem "best_in_place", github: "negativetwelve/best_in_place"
gem "impressionist", github: "negativetwelve/impressionist"
gem "obfuscate_id", github: "negativetwelve/obfuscate_id"
gem "rails4-autocomplete", "1.1.0"
gem "jquery-countdown-rails", "~> 2.0.0"
gem "unicorn", "4.8.3"
gem "travis", github: "travis-ci/travis.rb"
gem "rails_autolink", "~> 1.1.6"

# Uploads
gem "carrierwave", "~> 0.10.0"
gem "fog", "~> 1.22.1"
gem "rmagick", "~> 2.13.2", require: false
gem "remotipart", "~> 1.2"

# STI
gem "store_base_sti_class", github: "negativetwelve/store_base_sti_class"

# Background processing
gem "sidekiq", "~> 3.2.1"
gem "carrierwave_backgrounder", "~> 0.4.1"

# LinkedIn Integration
gem "omniauth"
gem "omniauth-linkedin"
gem "linkedin"

# Code Submissions
gem "ace-rails-ap"

# Notifications
gem "toastr-rails"
gem "toastr-rails-sass", "~> 2.0.1"

# Charts
gem "highcharts-rails", "~> 3.0.0"
gem "lazy_high_charts", github: "negativetwelve/lazy_high_charts"

# Search
gem "pg_search"

# Uploading
gem "paperclip", "~> 4.1"
gem "aws-sdk", "~> 1.5.7"

# Default Active Record values
gem "default_value_for", "~> 3.0.0"

# Peek
gem "peek"
gem "peek-git"
gem "peek-performance_bar"
gem "peek-pg"
gem "peek-resque"
gem "peek-sidekiq"

group :doc do
  gem "sdoc", require: false
end

group :development, :test do
  gem "annotate", "~> 2.6.1"
  gem "awesome_print", "~> 1.2.0"
  gem "better_errors", "~> 1.1.0"
  gem "binding_of_caller", "~> 0.7.2"
  gem "bullet", "~> 4.8.0"
  gem "commands", "~> 0.2.1"
  gem "factory_girl_rails", "~> 4.4.0"
  gem "rails_best_practices", "~> 1.15.1"
  gem "rspec-rails", "~> 2.14.1"
  gem "quiet_assets", "~> 1.0.2"
  gem "guard"
  gem "guard-livereload"
  gem "guard-rspec"
end

group :test do
  gem "database_cleaner"
end

group :development do
  # For the blog
  gem "github-pages"
  gem "tzinfo-data"
  gem "foreman",  "~> 0.63"
end

group :production do
  gem "rails_12factor"
  gem "newrelic_rpm"
end
