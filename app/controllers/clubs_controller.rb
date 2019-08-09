class ClubsController < ApplicationController
  before_action :authenticate_club_admin!
  before_action :set_club, only: [:index, :edit, :show, :update]
  before_action :set_club_manager, only: [:index]
  before_action :set_club_member, only: [:index]

  def index
    # Should display all the clubs that the user manages
  end

  def show
  end

  def update
    @club = Club.friendly.find(params[:id])
    if @club.update(club_params)
      flash[:notice] = "Successfully updated your club details"
    else
      flash[:alert] = "We had some issues saving your club details, refer below."
    end
    render template: 'clubs/edit'
  end

  private
  def club_params
    accepted_params = params.require(:club).permit(:display_picture, :description, :social_media, gallery: [])
    accepted_params[:gallery].reject! { |photo_url| photo_url.empty? }
    return accepted_params
  end

  def set_club
    @club = current_club_admin.club
  end
  
  def set_club_manager
    @club_manager = ClubAdminDelegate.new(club_id: @club.id)
  end

  def set_club_member
    @club_member = ClubMember.new(club_id: @club.id)
  end

end
