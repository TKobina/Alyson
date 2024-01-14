mock_data = YAML.load_file("#{Rails.root.to_s}/db/seeds/mock_data.yml")

#FIND AND DESTROY MOCK DATA IF IT ALREADY EXISTS
#Get all mock user id's, store them in array
mock_users_id = []
mock_data['users'].each { |x| mock_users_id << User.find_by(email: x['email']).id if User.where(email: x['email']).exists? }

#Destroy all records belonging to each mock user, then destroy all mock users
mock_users_id.each { |x| Entity.where(user_id: x).destroy_all }
mock_users_id.each { |x| Event.where(user_id: x).destroy_all }
mock_users_id.each { |x| User.find(x).destroy }


#RE-SEED MOCK DATA
#Create Users
User.create!(mock_data["users"])

#Get new id's for Users
mock_users_id = []
mock_data['users'].each { |x| mock_users_id << User.find_by(email: x['email']).id if User.where(email: x['email']).exists? }

#Create Entities: more complicated, because they need to belong to a User
