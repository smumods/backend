class Review < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :professor, required: false
  belongs_to :course, required: true
  has_many :votes, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :professor
  accepts_nested_attributes_for :votes
  accepts_nested_attributes_for :course

  # Validations
  # Validate that review_type is either 'prof' or 'mod'
  validates :type_of_review, inclusion: ['prof', 'mod']

  # Bookmarks/Likes/Etc
  # has_many :like_by_users

  def total_vote_score
    self.votes.sum("vote_type")
  end

  def total_prof_score
    self.votes.where(review_type: "prof").sum("vote_type")
  end
  
  def total_mod_score
    self.votes.where(review_type: "mod").sum("vote_type")
  end
end
