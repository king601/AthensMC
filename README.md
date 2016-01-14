# README
Source code for the webapp for AthensMC.com

## Rules for Commits
* No Commented Out Code
* Try and be clean with HTML/ERB
* Work in a branch, then do a pull request!

## Roadmap
* Add welcome email
* Add repeating email every month that sends an email with instructions to users who aren't whitelisted/have a whitelist app existing.
* Upgrade to Ruby 2.2.4 or 2.3.0 + test app to ensure it doesn't break anything
* Forum System
* User Profile Pages
* Revisit whitelist System
* @User Mentions / Emojis
* Search across Forums / Site
* Give the ability to change MC Accounts for users to Admins
* Make the Linking Minecraft flash message actually link/explain why we need to link accounts

## Setting up local development environment
1. Install Ruby
2. Install Bundler
3. Install Rails (v4.2.5 currently)
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
`rails server`
