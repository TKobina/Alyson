class SeederClass
  def data
    @mock_data
  end

  def initialize(data_file)
    @mock_data = YAML.load_file("#{Rails.root.to_s}" + data_file)
  end

  def unseed
    #Get all mock user id's, store them in array
    mock_users_id = []
    @mock_data['users'].each { |x| mock_users_id << User.find_by(email: x['email']).id if User.where(email: x['email']).exists? }

    #Destroy all records belonging to each mock user, then destroy all mock users
    mock_users_id.each { |x| Entity.where(user_id: x).destroy_all }
    mock_users_id.each { |x| Event.where(user_id: x).destroy_all }
    mock_users_id.each { |x| User.find(x).destroy }
  end

  def seed
    #Seed mock data
    #Create Users
    User.create!(@mock_data["users"])

    #Get id's for newly created users
    mock_users_id = []
    @mock_data['users'].each { |x| mock_users_id << User.find_by(email: x['email']).id if User.where(email: x['email']).exists? }
  end
end