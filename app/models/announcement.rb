class Announcement < ApplicationRecord
    # Make announcements orderable in ActiveAdmin
    acts_as_list

    # Validations
    validates_presence_of [:title, :description, :valid_from, :expires_on, :main_image]
    validates_presence_of :target_link, if: proc { self.is_direct_link && self.target_link }
    before_validation :smart_add_url_protocol, unless: proc { self.target_link.nil? || self.target_link.empty? }

    protected

    def smart_add_url_protocol
        unless self.target_link[/\Ahttp:\/\//] || self.target_link[/\Ahttps:\/\//]  
            self.target_link = "https://#{self.target_link}"
        end
    end
end
