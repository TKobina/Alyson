namespace :db do

  desc "Seeds mock data into database"
  task seed_mock: :environment do
    seeder = SeederClass.new("/db/seeds/mock_data.yml")
    seeder.seed()
  end

  desc "Unseed mock data from database"
  task unseed_mock: :environment do
    seeder = SeederClass.new("/db/seeds/mock_data.yml")
    seeder.unseed()
  end
end