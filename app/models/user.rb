class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :database_authenticatable

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
  validates :email, format: { with:  /([A-Z0-9._%a-z-]+@(sis|mitb|business|mba|mtsc|mwm|mqf|gmf|maf|mi|mim|mcm|mhcl|emba|economics|mse|msfe|mf|socsc|accountancy|mcfo|mpa|msa|law|llm|jd){1}.smu.edu.sg)/ }

  # Bookmarks/Likes/Etc
  action_store :bookmark, :professor, counter_cache: true
  action_store :bookmark, :course, counter_cache: true

  # Actions
  before_create :generate_email_token, if: Proc.new { |user| not user.verified }
  after_create :send_verification_email

  def self.validate_email_format(email)
    email =~ /([A-Z0-9._%a-z-]+@(sis|mitb|business|mba|mtsc|mwm|mqf|gmf|maf|mi|mim|mcm|mhcl|emba|economics|mse|msfe|mf|socsc|accountancy|mcfo|mpa|msa|law|llm|jd){1}.smu.edu.sg)/
  end

  def self.validate_reset_token_and_update_password(uuid, token, password)
    user = User.find_by(uuid: uuid, password_reset_token: token)
    return false if user.nil?
    # If the user hasn't tried to use this token more than 3 times
    if user.password_token_tries_count < 3
      return user.update(password: password, password_reset_token: nil, password_token_tries_count: 0, password_reset_tries_count: 0)
    else
      return false
    end
  end

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

  def generate_password_reset_token
    if self.password_reset_token.nil? and self.password_reset_tries_count <= 3
      self.password_reset_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(password_reset_token: random_token)
      end
      self.password_reset_created_at = Time.now
      self.password_reset_tries_count += 1
      return self.save
    else
      return false
    end
  end

  def increment_password_token_tries_count
    self.password_token_tries_count += 1
    self.save
  end
end
