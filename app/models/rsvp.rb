class Rsvp < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :event

  # Validations
  validates :user, uniqueness: { scope: :event, message: "You can only RSVP for an Event once!" }
end
