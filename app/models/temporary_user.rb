class TemporaryUser < ApplicationRecord
    validates :session_token, uniqueness: true
    validates :client_verifier, uniqueness: true

    before_create :generate_session_token
    before_create :generate_client_verifier

    def generate_session_token
        self.session_token = loop do
            random_token = SecureRandom.urlsafe_base64(nil, false)
            break random_token unless self.class.exists?(session_token: random_token)
        end
    end

    def generate_client_verifier
        self.client_verifier = loop do
            random_token = SecureRandom.urlsafe_base64(nil, false)
            break random_token unless self.class.exists?(client_verifier: random_token)
        end
    end

    def generate_email_verification_token!
      self.email_verification_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(email_verification_token: random_token)
      end
    end

    def generate_login_token!
      if self.login_token.nil?
        self.login_token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(login_token: random_token)
        end
      end
    end
end
