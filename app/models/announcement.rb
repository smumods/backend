class Announcement < ApplicationRecord
    # Make announcements orderable in ActiveAdmin
    acts_as_list

    # Scopes
    scope :unstarted, -> { where("? < valid_from", Date.today) }
    scope :active, -> { where("valid_from < ? AND expires_on > ?", Date.today, Date.today) }
    scope :expired, -> { where("expires_on < ?", Date.today) }

    # Validations
    validates_presence_of [:title, :description, :valid_from, :expires_on, :main_image]
    validates_presence_of :target_link, if: proc { self.is_direct_link && self.target_link }
    before_validation :smart_add_url_protocol, unless: proc { self.target_link.nil? || self.target_link.empty? }
    
    def self.filtering_scopes
        [:active, :unstarted]
    end

    def status
        return "active" if self.valid_from < Date.today && self.expires_on > Date.today
        return "unstarted" if Date.today < self.valid_from
        return "expired" if self.expires_on < Date.today
    end

    protected

    def smart_add_url_protocol
        unless self.target_link[/\Ahttp:\/\//] || self.target_link[/\Ahttps:\/\//]  
            self.target_link = "https://#{self.target_link}"
        end
    end

end
