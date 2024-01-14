class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user
  
  has_many :entities_events
  has_many :entities, through: :entities_events
end
