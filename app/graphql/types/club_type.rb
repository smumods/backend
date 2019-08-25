module Types
	class ClubType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :slug, String, null: false
		field :display_picture, String, null: false
		field :display_picture_thumbnail, String, null: false
		field :gallery, [String], null: true
		field :description, String, null: true
		field :social_media, String, null: true
		field :all_upcoming_events, Types::EventType.connection_type, null: false
		field :all_past_events, Types::EventType.connection_type, null: false
		field :created_at, Types::DateTimeType, null: false
		field :updated_at, Types::DateTimeType, null: false

    def display_picture
      if object.display_picture and object.display_picture.attached?
        return object.display_picture.service_url
      end
      return ""
    end

    def display_picture_thumbnail
      thumbnail_image = object.display_picture_sized(:thumbnail)
      if thumbnail_image and thumbnail_image.processed
        return thumbnail_image.service_url
      end
      return ""
    end

    def gallery
      if object.gallery and object.gallery.attached?
        return object.gallery.attachments.map(&:service_url)
      end
      return [""]
    end

		def all_upcoming_events
			upcoming_events = object.events.where("start_date >= ?", Time.now)
			return upcoming_events
			# RecordLoader.for(Event).load_many(upcoming_events.ids)
		end

		def all_past_events
			object.events.where("start_date < ?", Time.now)
		end
	end
end
