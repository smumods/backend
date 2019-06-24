class Vote < ApplicationRecord
  # Relationships
  belongs_to :user, validate: true
  belongs_to :review, validate: true

  # Validate that vote_type is between -1 and 1
  validates :vote_type, inclusion: (-1..1)
  # Validate that review_type is either 'prof' or 'mod'
  validates :review_type, inclusion: ['prof', 'mod']
end
