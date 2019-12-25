class Book < ApplicationRecord
  #use this to define relationship between different model objects
  #so you can use any of the helper methods to see what you wannad do
  # Relationships
  belongs_to :user
  belongs_to :course

  # Serializers
  serialize :authors, Array
  serialize :photos, Array

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :isbn10, presence: true
  validates :isbn10, format: { with: /\A\d{9}[\d|X]$\z/, message: "Must be a valid ISBN10 format!" }
  validates :isbn13, presence: true
  validates :isbn13, format: { with: /\A(97(8|9))+(-)?\d{9}(\d|X)$\z/, message: "Must be a valid ISBN13 format!" }
end
