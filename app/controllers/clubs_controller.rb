class ClubsController < ApplicationController

  def index
    # Should display all the clubs that the user manages
    @clubs = Club.all
  end

  def show
    
  end

  private
  def club_params
    params.require(:club).permit(:name, :slug, :display_picture, :gallery, :description, :social_media)
  end

end
