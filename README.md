# README

# Resources
* https://dev.to/kevinluo201/how-to-setup-very-basic-devise-in-rails-7-55ia

# Devise
* $ rails g devise:views
* configuring
  * config/initializers/devise.rb
    * config.timeout_in = 30.minutes
  * config/locales/devise.en.yml
* methods
  * user_signed_in?
  * current_user
  * user_session