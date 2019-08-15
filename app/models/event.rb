class Event < ApplicationRecord
  # Relationships
  belongs_to :club
  has_many :rsvps
  has_many :users, through: :rsvps

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :main_image, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :color, inclusion: { in: ["background: rgba(7,64,249,0.70);", "background: rgba(218,27,18,0.70);", "background: rgba(124,157,126,0.70);", "background: rgba(76,80,87,0.70);"] }

end
