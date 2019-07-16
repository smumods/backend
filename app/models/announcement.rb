class Announcement < ApplicationRecord
    validates_presence_of [:title, :description, :valid_from, :expires_on, :main_image]
end
