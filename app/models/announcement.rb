class Announcement < ApplicationRecord
    validates_presence_of [:title, :order, :description, :valid_from, :expires_on, :main_image]
    validates_uniqueness_of :order
end
