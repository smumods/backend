class Review < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :professor, required: false
  belongs_to :course, required: false
  has_many :votes
  has_many :votants, through: :votes

  # Validations
  # Validate that review_type is either 'prof' or 'mod'
  validates :type_of_review, inclusion: ['prof', 'mod']

  def total_vote_score
    self.votes.sum("vote_type")
  end
end
