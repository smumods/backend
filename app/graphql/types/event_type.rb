module Types
	class EventType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :description, String, null: false
		field :main_image, String, null: false
		field :gallery, String, null: true
		field :color, String, null: true
		field :start_date, Types::DateTimeType, null: false
		field :end_date, Types::DateTimeType, null: false
		field :location, String, null: true
		field :price, String, null: true
		field :require_rsvp, Boolean, null: false
        field :rsvp_by, Types::DateTimeType, null: true
		field :club, Types::ClubType, null: false
		field :all_users, [Integer, null: true], null: false
		field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false
        
        def club
			# RecordLoader.for(Club).load(object.club_id)
			BatchLoader::GraphQL.for(object.club_id).batch do |club_ids, loader|
				Club.where(id: club_ids).each { |club| loader.call(club.id, club) }
			end
		end
		
		def all_users
			object.user_ids
			# ForeignKeyLoader.for(Rsvp, :event_id).load(object.id) do |rsvp|
			# 	RecordLoader.for(User).load(rsvp.user_id)
			# end

			# Loaders::ForeignKeyLoader.for(Milestone, :project_id).load([object.id])
			
			# RecordLoader.for(User).load_many(object.users)
			# BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |event_ids, loader|
				# loader.call(event_ids)
				# Rsvp.includes(:user).joins(:user).where(event_id: event_ids).each do |rsvp|
				# 	loader.call(rsvp.user_id)
				# end
			# end
		end

	end
end