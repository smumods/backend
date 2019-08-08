module Types
	class EventType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :description, String, null: false
		field :main_image, String, null: false
		field :gallery, String, null: false
		field :color, String, null: false
		field :start_date, Types::DateTimeType, null: false
		field :end_date, Types::DateTimeType, null: false
		field :location, String, null: false
		field :price, String, null: false
		field :require_rsvp, Boolean, null: false
        field :rsvp_by, Types::DateTimeType, null: false
        field :club, Types::ClubType, null: false
		field :created_at, Types::DateTimeType, null: false
    	field :updated_at, Types::DateTimeType, null: false
	end
end