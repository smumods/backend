class Event < ApplicationRecord
  # Relationships
  belongs_to :club

  # Validations
  validates :name, presence: true
end
