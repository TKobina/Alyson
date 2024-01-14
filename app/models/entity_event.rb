class EntitiesEvent < ApplicationRecord
  belongs_to :user
  validates_presence_of :user

  belongs_to :entities
  belongs_to :events
end
