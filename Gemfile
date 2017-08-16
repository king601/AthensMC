source 'https://rubygems.org'

git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'

# Use Puma as the app server
gem 'puma', '~> 3.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', github: 'turbolinks/turbolinks-classic'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

#Bootstrap for HTML framework
gem 'bootstrap-sass', '~> 3.3.7'

#Font Awesome for Visual Improvements
gem 'font-awesome-rails'

# Decorators
gem 'draper', '~> 3.0.0.pre1'

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'listen', '~> 3.1.5'

  # Use Capistrano for deployment
  gem 'capistrano', '3.8.0'
  gem 'capistrano-bundler', '~> 1.1.4'
  gem 'capistrano-rails', '~> 1.1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv', '~> 2.1'

  gem 'faker', github: 'stympy/faker'
end

group :test do
  gem 'minitest-rails', '~> 3.0'
  gem 'minitest-rails-capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Formatting for Text Stuff!
gem 'html-pipeline'
gem 'github-markdown'
gem 'commonmarker'
gem 'sanitize'

# Pagination
gem 'will_paginate', '~> 3.1.5'
gem 'will_paginate-bootstrap', '~> 1.0.1'

#Local Time
gem 'local_time', '~> 1.0.3'

# User Accounts & Authentication
gem 'devise', '~> 4.3'
gem 'pundit', '~> 1.1.0'

#Postgres for deployment
gem 'pg'

#Mojang API Gem..
gem 'mojang_api', '~> 0.0.2'

# Friendly ID
gem 'friendly_id', '~> 5.1.0'

# Background Job Processing
gem 'sucker_punch', '~> 2.0'

# Search is Awesome
gem 'searchkick', '~> 1.3.6'

# jQuery UI Gem for autocomplete and other stuff
gem 'jquery-ui-rails'

# Slack Notifier
gem 'slack-notifier', '~> 1.5.1'

# Charts are cool!
gem 'chartkick', '~> 2.2.4'

# Group things by their dates
gem 'groupdate'

# Trix editor by basecamp
gem 'trix'

# Record Tag helper gem for div_for
gem 'record_tag_helper', '~> 1.0'
