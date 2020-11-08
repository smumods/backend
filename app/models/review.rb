class Review < ApplicationRecord
  # Constants
  VULGARITIES_LIST = ['fuck', 'cock', 'pussy', 'asshole', 'cunt', 'pig', 'dick', 'wanker', 'chi bai', 'cb']
  TRUNCATE_LENGTH = ENV["TRUNCATED_REVIEW_LENGTH"].to_i || 100

  # Relationships
  belongs_to :user, touch: true
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

  # Callbacks
  before_save :set_module_code_for_course_review

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
    if professor_review and VULGARITIES_LIST.any? { |s| professor_review.include? s }
      errors.add(:professor_review, "No profanity allowed in Professor Review")
    end
    if module_review and VULGARITIES_LIST.any? { |s| module_review.include? s }
      errors.add(:module_review, "No profanity allowed in Module Review")
    end
  end

  def set_module_code_for_course_review
    self.module_code = self.course.module_code if self.course_id
  end
end
