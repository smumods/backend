class ClubManagersController < ApplicationController
    before_action :authenticate_club_admin!
    before_action :set_club
    
    def create
        binding.pry
    end
    
    def destroy
        binding.pry
    end

    private
    def set_club
        @club = current_club_admin.club
    end
end
