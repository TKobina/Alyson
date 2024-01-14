# README
I spent a while attempting to host MonicaHQ on my personal machine, unsuccessfully; ultimately, I decided this was a project that it would be worth my time to build myself, as there were a number of features in MonicaHQ that I didn't care about, and there are a number of features I want that didn't exist there, and I need to be spending more time in code.

# NOTES
## Seeding
### Mock Data
* Use SeederClass and seed_mock.rake to generate mock data
  * Prerequisites:
    * Faker gem
    * Storing gmail account for testing and a password in the application credentials
      * Using credentials.yml.enc to store a base gmail account for testing
        * rails credentials:edit
        * add line with the base "username" (everything before the @gmail.com): 
          * mock_seeding_email: "testemail"
          * Accessible by Rails.application.credentials.mock_seeding_email
        * add line with the mock password:
          * mock_password: "TestPassword"
          * * Accessible by Rails.application.credentials.mock_password
  * Set options (like the number of mock users to generate, etc.) in the rake file
  * Commands
    * rails db:seed_mock
    * rails db:unseed_mock

# TO DO
* ~~~Rough-in: Events: Controller & Views~~~
* Add: Seed!
  * ~~~check that mock data isn't uploaded to github~~~
  * populate mock_data_example.yml
  * add unseeed_mock.rake
* Add: flash for attempting to access record of different user?
  * send to 404?
  * Or, if attempting to access id that doesn't exist, flash and redirect to events/entities_path?
* Extend: all New/Edit views: add cancel button to form
* Rough-in: EntitiesEvents
  * Add to seeding
* Rough-in: Relationships
  * Add to seeding
* Add: Contact Methods
* Extend: Entities
  * Type
  * Contact information
  * Birthday
* Devise
  * https://medium.com/@learnwithalfred/rails-7-authentication-with-devise-gem-add-custom-fields-a633982bef58
    * look into all this
  * password resets, confirmation e-mails, etc.
  * require strong passwords
  * https://bogotobogo.com/RubyOnRails/RubyOnRails_Devise_Authentication_Sending_Confirmation_Email.php
  * How to stop non-privileged from accessing pages? Can easily restrict data, but....
    * https://stackoverflow.com/questions/11230130/rails-routes-based-on-condition
    * ??encrypt id's?? Do we care if id's of records are exposed??
  * Entitities Controller:
    * ~~~before_show: check that current_user has access to that id~~~
* Refactoring
  * abstract: check_ownership into a concern?
* Task: Deleted Users:
  * How do we handle if a user is deleted? Create a task that searches for orphans and destroys them?
  * Delete all records belonging to that user?
  * Not sure that's currently happening, and it probably should
* Development => Production
  * MongoDB?
  

# NOTES FOR MYSELF
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

# Resources
* https://guides.rubyonrails.org/getting_started.html
* Devise
  * https://dev.to/kevinluo201/how-to-setup-very-basic-devise-in-rails-7-55ia
* DB & ActiveRecord stuff
  * https://rachelaemmer.medium.com/building-a-many-to-many-relationship-in-rails-efeee50a23ad
  * https://emcorrales.com/blog/rails-setup-multiple-associations-same-model
* Rake Tasks
  * https://medium.com/geekculture/writing-custom-rake-tasks-f656f43336cc