# README
Source code for the webapp for AthensMC.com

This app works to improve communication and coordination between the community and the operators.

## Rules for Commits
* No Commented Out Code
* Try and be clean with HTML/ERB
* Work in a branch, then do a pull request!

## Roadmap
* Add welcome email
* Add repeating email every month that sends an email with instructions to users who aren't whitelisted/have a whitelist app existing.
* Revisit whitelist System
* @User Mentions / Emojis
* Search across Forums / Site
* Give the ability to change MC Accounts for users to Admins
* Make the Linking Minecraft flash message actually link/explain why we need to link accounts

## Setting up local development environment
1. Install Ruby (2.3.1)
2. Install Bundler
3. Install Rails (5.0.0.1 currently)
4. Install PostgreSQL/all requirements for OS
5. Run
  * `cp config/secrets.yml.example config/secrets.yml`
  * `cp config/database.yml.example config/database.yml`
  * Make the changes to config/secrets.yml and config/database.yml relating to your development install. Then continue.
  * `bundle install`
  * `rails db:create`
  * `rails db:migrate`

Then you should be good to go!

## Server
We don't explicitly require you to use Foreman but if you're so inclined..

`gem install foreman`

Then you can start the server with the included Procfile by running

```
foreman start -f Procfile.dev
```
