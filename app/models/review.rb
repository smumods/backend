class Review < ApplicationRecord
  belongs_to :user
  belongs_to :professor
  belongs_to :course
end
