namespace :db do
  task mock: :environment do
    load Rails.root / 'db' / 'seeds' / 'mock_seeds.rb'
  end
end