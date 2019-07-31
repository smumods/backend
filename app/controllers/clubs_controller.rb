class ClubsController < ApplicationController
  before_action :authenticate_club_admin!
  before_action :set_club, only: [:index, :edit, :show, :update]

  def index
    # Should display all the clubs that the user manages
  end

  def show    
  end

  def update
    if @club.update(club_params)
      redirect_back(fallback_location: dashboard_path, notice: "Saved club details")
    else
      redirect_back(fallback_location: dashboard_path, alert: "Failed to save club details")
    end
  end

  private
  def club_params
    params.require(:club).permit(:name, :slug, :display_picture, :gallery, :description, :social_media)
  end

  def set_club
    @club = current_club_admin.club
  end

end
