class Book < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :course

  # Serializers
  serialize :authors, Array
  serialize :photos, Array
end
