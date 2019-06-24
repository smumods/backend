class Review < ApplicationRecord
  belongs_to :user
  belongs_to :professor, required: false
  belongs_to :course
  has_many :votes
  has_many :votants, through: :votes
end
