json.extract! event, :id, :name, :description, :main_image, :gallery, :color, :start_date, :end_date, :location, :price, :require_rsvp, :rsvp_by, :club_id, :created_at, :updated_at
json.url event_url(event, format: :json)
