class ClubManagersController < ApplicationController
    before_action :authenticate_club_admin!
    before_action :set_club, only: [:destroy, :create]
    
    def create
        user = User.find_by_email(params[:email_address])
        if user
            club_manager = ClubAdminDelegate.find_by(club_id: @club.id, user_id: user.id)
            if club_manager
                redirect_back(fallback_location: dashboard_path, alert: "The user is already an admin!")
            else
                if ClubAdminDelegate.create(club_id: @club.id, user_id: user.id)
                    redirect_back(fallback_location: dashboard_path, notice: "Added user!")
                else
                    redirect_back(fallback_location: dashboard_path, alert: "Issue adding user")
                end
            end
        else
            redirect_back(fallback_location: dashboard_path, alert: "Invalid email")
        end
    end
    
    def destroy
        club_admin_delegate = ClubAdminDelegate.find_by(user_id: params[:id], club_id: @club.id)
        if club_admin_delegate.destroy!
            redirect_back(fallback_location: dashboard_path, notice: "Removed Club Admin")
        else
            redirect_back(fallback_location: dashboard_path, alert: "Could not delete the Club Admin due to an unexpected error")
        end
    end

    private
    def set_club
        @club = current_club_admin.club
    end
end
