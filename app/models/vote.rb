class Vote < ApplicationRecord
  # Relationships
  belongs_to :user, validate: true
  belongs_to :review, validate: true

  # Enums for vote_type
  enum selectable_vote_types: [ :downvote, :upvote ]
end
