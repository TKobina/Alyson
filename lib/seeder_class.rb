class SeederClass

  def initialize

  end


  def data
    #@mock_data
  end

  def unseed
    mock_user_ids = read_mock_user_ids

    mock_user_ids.each { |x| Entity.where(user_id: x).destroy_all }
    mock_user_ids.each { |x| Event.where(user_id: x).destroy_all }
    mock_user_ids.each { |x| User.find(x).destroy }

    write_mock_user_ids([])
  end

  def seed_users(n)
    base_email = Rails.application.credentials.mock_seeding_email
    mock_password = Rails.application.credentials.mock_password
    
    mock_user_ids = []

    begin
      n.times do      
        mock_user_ids << User.create!(
          email: base_email + "+" + Faker::Name.first_name + Time.now.to_i.to_s + "@gmail.com",
          password: mock_password,
          password_confirmation: mock_password,
          privileged: true
        ).id
      end
    rescue
      puts "SeederClass::seed_users broke, for some reason; ids for mock users already generated:"
      puts mock_user_ids
    end

    append_mock_user_ids(mock_user_ids)
  end

  def seed_entities(n)
    mock_user_ids = read_mock_user_ids
    mock_user_ids.each do |id|
      n.times do 
        Entity.create!(
          user_id: id,
          name:  generate_entity_name,
          about: generate_text
        )
      end
    end
  end

  def seed_events(n)
    #n.times do  
    #end
  end

  private

  def append_mock_user_ids(mock_user_ids)
    extant_ids = read_mock_user_ids
    write_mock_user_ids((mock_user_ids + extant_ids).uniq)
  end

  def write_mock_user_ids(mock_user_ids)
    titled_ids = { :title => "mock_user_ids", user_ids: mock_user_ids}
    File.open("#{Rails.root.to_s}/db/seeds/mock_data.yml", "w") { |file| file.write(titled_ids.to_yaml) }
  end

  def read_mock_user_ids
    YAML.load_file("#{Rails.root.to_s}/db/seeds/mock_data.yml")[:user_ids]
  end

  def generate_entity_name
    case rand(24)
    when 0
       Faker::Books::Dune.character
    when 1
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character
    when 2
       Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet
    when 3
       Faker::Books::Dune.character + " of " + Faker::Books::Dune.city
    when 4
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet
    when 5
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.city
    when 6
       Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location
    when 7
       Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet
    when 8
       Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location
    when 9
       Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet
    when 10
       Faker::Books::TheKingkillerChronicle.character + " of " + Faker::Books::TheKingKillerChronical.location
    when 11
       Faker::Books::TheKingkillerChronicle.character + " " + Faker::Books::TheKingKillerChronical.creature
    when 12
       Faker::Fantasy::Tolkien.character
    when 13
       Faker::Games::WarhammerFantasy.hero
    when 14
       Faker::Games::Myst.character
    when 15
       Faker::Games::DnD.name
    when 16
       Faker::Games::DnD.first_name + " of " + Faker::Games::DnD.city
    when 17
       Faker::Games::ElderScrolls.name
    when 18
       Faker::Games::ElderScrolls.first_name + " of " + Faker::Games::ElderScrolls.region
    when 19
       Faker::Games::FinalFantasyXIV.character
    when 20
       Faker::Games::Witcher.character
    when 21
       Faker::Movies::HitchhikersGuideToTheGalaxy.character
    when 22
       Faker::Movies::HitchhikersGuideToTheGalaxy.character + " of " + Faker::Movies::HitchhikersGuideToTheGalaxy.planet
    when 23
      Faker::Book.author
    when 24
      Faker::Drone.name 
    end
  end

  def generate_text
    case rand(21)
    when 1
      Faker::Books::Dune.quote
    when 2
      Faker::Books::Dune.saying
    when 3
      Faker::Books::Lovecraft.sentence
    when 4
      Faker::Fantasy::Tolkien.poem
    when 5
      Faker::Games::WarhammerFantasy.quote
    when 6
      Faker::Games::Myst.quote
    when 7
      Faker::Games::Witcher.quote
    when 8
      Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
    when 9
      Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    when 10
      Faker::Quotes::Chiquito.expression
    when 11
      Faker::Quotes::Chiquito.sentence
    when 12
      Faker::Quote.famous_last_words
    when 13
      Faker::Quote.jack_handey
    when 14
      Faker::Quote.matz
    when 15
      Faker::Quote.most_interesting_man_in_the_world
    when 16
      Faker::Quote.robin
    when 17
      Faker::Quotes::Rajnikanth.joke
    when 18
      Faker::Quotes::Shakespeare.hamlet_quote
    when 19
      Faker::Quotes::Shakespeare.as_you_like_it_quote
    when 20
      Faker::Quotes::Shakespeare.king_richard_iii_quote
    when 21
      Faker::Quotes::Shakespeare.romeo_and_juliet_quote
    end
  end
end