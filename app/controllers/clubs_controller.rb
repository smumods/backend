class ClubsController < ApplicationController
  before_action :authenticate_club_admin!

  def index
    # Should display all the clubs that the user manages
    @club = current_club_admin.club
  end

  def show
    
  end

  private
  def club_params
    params.require(:club).permit(:name, :slug, :display_picture, :gallery, :description, :social_media)
  end

end
