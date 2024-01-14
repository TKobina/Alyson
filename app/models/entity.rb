class Entity < ApplicationRecord
  belongs_to :user
  validates_presense_of :name, :user
  
end
