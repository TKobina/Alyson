# README

# To Do
* Devise
  * https://medium.com/@learnwithalfred/rails-7-authentication-with-devise-gem-add-custom-fields-a633982bef58
    * look into all this
  * password resets, confirmation e-mails, etc.
  * require strong passwords
  * https://bogotobogo.com/RubyOnRails/RubyOnRails_Devise_Authentication_Sending_Confirmation_Email.php
  

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