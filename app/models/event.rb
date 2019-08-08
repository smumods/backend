class Event < ApplicationRecord
  # Relationships
  belongs_to :club
  has_many :rsvps
  has_many :users, through: :rsvps

  # Validations
  validates :name, presence: true
end
