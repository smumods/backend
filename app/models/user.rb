class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :database_authenticatable, :token_authenticatable

  # Relationships
  has_many :books, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
