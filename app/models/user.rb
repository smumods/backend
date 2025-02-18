class User < ApplicationRecord
  # CONSTANTS
  def self.MAX_VERIFICATION_TRIES
    5
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, password_length: 8..128

  # Analytics
  has_many :visits, class_name: "Ahoy::Visit"

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
  validates :email, format: { with:  /\A([A-Z0-9._%a-z-]+@(exchange|sis|mitb|business|mais|mba|mtsc|mwm|mqf|gmf|maf|mi|mim|mcm|mhcl|emba|economics|mse|msfe|mf|socsc|accountancy|mcfo|mpa|msa|law|llm|jd|ddptechmgt){1}.smu.edu.sg)\z/ }

  # Bookmarks/Likes/Etc
  action_store :bookmark, :professor, counter_cache: true
  action_store :bookmark, :course, counter_cache: true
  action_store :bookmark, :book, counter_cache: true

  # Actions
  before_save { self.email_token = nil if self.email_token == "" }
  before_save { self.email = self.email.downcase }
  before_create :generate_email_token
  after_create :reload_uuid # make sure its reloaded before sending verification emails
  
  
  # Email Actions
  after_create :send_verification_email  # buggy at the moment

  def self.validate_email_format(email)
    email =~ /\A([A-Z0-9._%a-z-]+@(exchange|sis|mitb|business|mais|mba|mtsc|mwm|mqf|gmf|maf|mi|mim|mcm|mhcl|emba|economics|mse|msfe|mf|socsc|accountancy|mcfo|mpa|msa|law|llm|jd|ddptechmgt){1}.smu.edu.sg)\z/
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

  def can_read_review?
    min_reviews_count = ENV['MIN_REVIEWS_COUNT'].to_i || 2
    @_reviews_count ||= Rails.cache.fetch([self, "reviews_count"], expires_in: 5.minutes) { reviews.count }
    @_reviews_count >= min_reviews_count
  end
  
  def read_permissions
    permissions = []
    permissions += ['reviews', 'analytics'] if can_read_review?
    
    permissions
  end
  
  def send_verification_email
    UserMailer.send_verification_email(self.id).deliver unless self.verified
  end
  
  private
  def generate_email_token
      self.email_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(email_token: random_token)
      end
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

  def reload_uuid
    if self.attributes.has_key? 'uuid'
      self[:uuid] = self.class.where(id: id).pluck(:uuid).first
    end
  end
end
