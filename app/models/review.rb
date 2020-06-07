class Review < ApplicationRecord
  # Constants
  VULGARITIES_LIST = ['fuck', 'cock', 'pussy', 'asshole', 'cunt', 'pig', 'dick', 'wanker', 'chi bai', 'cb']

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
  validate :no_profanities

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

  private
  def no_profanities
    if VULGARITIES_LIST.any? { |s| professor_review.include? s }
      errors.add(:professor_review, "No profanity allowed in Professor Review")
    end
    if VULGARITIES_LIST.any? { |s| module_review.include? s }
      errors.add(:module_review, "No profanity allowed in Module Review")
    end
  end
end
