class EventsController < ApplicationController
  before_action :authenticate_club_admin!
  before_action :set_club
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_event_owner, only: [:show, :edit, :update, :destroy]

  def index
    @events = @club.events
  end

  def show
  end

  def new
    @event = @club.events.new
  end

  def create
    @event = @club.events.new(event_params)
    if @event.save
      redirect_to(events_path, notice: "Successfully added your Event")
    else
      flash[:alert] = "We had some issues saving your club details, refer below."
      render template: 'events/new'
    end
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    @event.image.attach(event_params[:image])
    if @event.update(event_params)
      flash[:notice] = "Successfully updated your event"
    else
      flash[:alert] = "We had some issues saving your event details, refer below."
    end
    render template: 'events/edit'
  end

  def destroy
    if @event.destroy!
      redirect_back(fallback_location: events_path, notice: "Successfully removed your Event")
    else
      redirect_back(fallback_location: events_path, notice: "Could not remove your Event. If this problem persists, contact us via telegram!")
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :main_image, :image, :color, :start_date, :end_date, :location, :price, :require_rsvp, :rsvp_by, :image, gallery: [])
    end

    def set_club
        @club = current_club_admin.club
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def authenticate_event_owner
      if @event.club_id != @club.id
        redirect_back(fallback_location: events_path, alert: "You have to be the admin of the Club owning that event to edit it")
        return false
      end
      return true
    end

end
