class Entity < ApplicationRecord
  belongs_to :user
  
  has_many :entities_events
  has_many :events, through: :entities_events
  
  has_many :relationship_left, class_name: 'Relationship', foreign_key: 'left_id'
  has_many :relationship_right, class_name: 'Relationship', foreign_key: 'right_id'
 
  validates_presence_of :name, :user
end
