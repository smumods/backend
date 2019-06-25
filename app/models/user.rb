class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :database_authenticatable, :token_authenticatable

  # Relationships
  has_many :books, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :reviews
  has_many :votes
  has_many :voted_reviews, through: :votes


  # Validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  # Bookmarks/Likes/Etc
  action_store :bookmark, :professor, counter_cache: true
  action_store :bookmark, :review, counter_cache: true
end
