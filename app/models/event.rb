class Event < ApplicationRecord
  belongs_to :user
  
  has_many :entities_events
  has_many :entities, through: :entities_events
  
  validates_presence_of :name, :user
end
