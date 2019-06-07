class TemporaryUser < ApplicationRecord
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
end
