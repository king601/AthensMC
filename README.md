# README
Source code for the webapp for AthensMC.com

## Rules for Commits
* No Commented Out Code
* Try and be clean with HTML/ERB
* Work in a branch, then do a pull request!

## Roadmap
* Forum System
* User Profile Pages
* Revisit whitelist System
* @User Mentions / Emojis
* Search across Forums / Site

## Setting up local development environment
1. Install Ruby
2. Install Bundler
3. Install Rails (v.4.2.0 currently)
4. Install PostgreSQL/all requirements for OS
5. Run
  * `cp config/secrets.yml.example config/secrets.yml`
  * `cp config/database.yml.example config/database.yml`
  * Make the changes to config/secrets.yml and config/database.yml relating to your development install. Then continue.
  * `bundle install`
  * `rake db:create`
  * `rake db:migrate`

Then you should be good to go!

You can start the development server locally by running:
`rails server -b 0.0.0.0`



--------
If having issues with assets pipeline, run "RAILS_ENV=production rake assets:precompile"
then restart the server


Rails 4.2.0 Upgrade
==============
Update Rails to 4.2.0
Tested against Ruby 2.1.2p95

may need to install "apt-get install libicu-dev" for syntax highlighting
"sudo apt-get install cmake" for rugged gem install
