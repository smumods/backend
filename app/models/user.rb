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
  has_many :sessions


  # Validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  # Bookmarks/Likes/Etc
  action_store :bookmark, :professor, counter_cache: true
  action_store :bookmark, :course, counter_cache: true

  # Actions
  before_create :generate_email_token, if: Proc.new { |user| not user.verified }
  after_create :send_verification_email

  private
  def generate_email_token
      self.email_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(email_token: random_token)
      end
  end

  def send_verification_email
    UserMailer.send_verification_email(self).deliver_now
  end
end
