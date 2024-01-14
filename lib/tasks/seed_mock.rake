namespace :db do

  desc "Seeds mock data into database"
  task seed_mock: :environment do
    seeder = SeederClass.new()
    seeder.seed_users(10)
  end

  desc "Unseed mock data from database"
  task unseed_mock: :environment do
    seeder = SeederClass.new()
    seeder.unseed()
  end
end