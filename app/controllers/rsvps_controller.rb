class RsvpsController < ApplicationController
  before_action :authenticate_club_admin!
  before_action :set_club
  before_action :set_event
  before_action :authenticate_event_owner

  def create
    target_user = User.find_by(email: params[:email_address])
    if target_user.nil?
      @rsvp_message = { message: "Whoops! There is no user with that email address.", status: "error" }
    else
      rsvp = target_user.rsvps.new(event_id: @event.id)
      if rsvp.save
        @rsvp_message = { message: "RSVPed #{target_user.email}", status: "success", rsvp: rsvp }
      else
        @rsvp_message = { message: "Could not RSVP the user due to #{rsvp.errors.full_messages.join(", ")}", status: "error" }
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def destroy
  end

  private
  def rsvp_params
    params.require(:rsvp).permit(:paid, :status, :notes)
  end

  def set_club
      @club = current_club_admin.club
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def authenticate_event_owner
    if @event.club_id != @club.id
      redirect_back(fallback_location: events_path, alert: "You have to be the admin of the Club owning that event to manage RSVPs for it")
      return false
    end
    return true
  end
end
