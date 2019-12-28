class ApplicationController < ActionController::Base
    before_action :set_view_options
    
    private
    def set_view_options()
        @view_options = {}
        @view_options['no_margin'] = false
    end

    # def authenticate_admin_user!
    #     redirect_to sign_in_path unless current_user.try(:admin_user?)
    # end
end
