module Types
	class ClubType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :slug, String, null: false
		field :display_picture, String, null: false
		field :gallery, String, null: false
		field :description, String, null: false
		field :social_media, String, null: false
		field :all_upcoming_events, [Types::EventType, null: true], null: false
		field :created_at, Types::DateTimeType, null: false
		field :updated_at, Types::DateTimeType, null: false
		
		def all_upcoming_events()
			upcoming_events = object.events.where("start_date >= ?", Time.now)
			return upcoming_events
			# RecordLoader.for(Event).load_many(upcoming_events.ids)
		end
	end
end