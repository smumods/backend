class Book < ApplicationRecord
  #use this to define relationship between different model objects
  #so you can use any of the helper methods to see what you wannad do
  # Relationships
  belongs_to :user
  belongs_to :course

  # Serializers
  serialize :authors, Array
  serialize :photos, Array
end
