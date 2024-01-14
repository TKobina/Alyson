class Relationship < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user
  
  belongs_to :left, class_name: 'Entity'
  belongs_to :right, class_name: 'Entity'
end
