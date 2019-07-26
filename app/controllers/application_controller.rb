class ApplicationController < ActionController::Base
    before_action :set_view_options
    
    private
    def set_view_options()
        @view_options = {}
        @view_options['no_margin'] = false
    end
end
