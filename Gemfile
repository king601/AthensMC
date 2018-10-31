source 'https://rubygems.org'

git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'webpacker'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.7'
gem 'redis', '~> 4.0'
gem 'hootstrap', github: 'ProctorU/hootstrap'
# gem 'hootstrap', path: '../hootstrap'
gem 'font-awesome-rails'
gem 'draper', '~> 3.0.0'

group :development do
  gem 'web-console', '~> 3.7'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen', '~> 3.0.5'
  gem 'capistrano', '3.8.0'
  gem 'capistrano-bundler', '~> 1.1.4'
  gem 'capistrano-rails', '~> 1.1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'faker', github: 'stympy/faker'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'minitest-rails', '~> 3.0'
  gem 'minitest-rails-capybara'
  gem 'webmock', '~> 3.4'
  gem 'vcr', '~> 4.0'
  gem 'mocha', '~> 1.6'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'html-pipeline'
gem 'github-markdown'
gem 'commonmarker'
gem 'sanitize'
gem 'kaminari', '~> 1.1.1'
gem 'local_time', '~> 2.1'
gem 'devise', '~> 4.4'
gem 'devise_masquerade', '~> 0.6.5'
gem 'pundit', '~> 2.0.0'
gem 'pg'
gem 'pg_search'
gem 'mojang_api', '~> 0.0.2'
gem 'friendly_id', '~> 5.2.4'
gem 'sucker_punch', '~> 2.0'
gem 'slack-notifier', '~> 1.5.1'
gem 'chartkick', '~> 2.3.5'
gem 'groupdate'
gem 'trix'
# Record Tag helper gem for div_for
gem 'record_tag_helper', '~> 1.0'

gem 'skylight'
gem 'attr_encrypted', '~> 3.0', '>= 3.0.3'
gem 'sshkey', '~> 1.8'
gem 'net-ssh', '~> 5.0'
