class Review < ApplicationRecord
  belongs_to :user
  belongs_to :professor, required: false
  belongs_to :course
end
