class ClubsController < InheritedResources::Base
  private

    def club_params
      params.require(:club).permit(:name, :slug, :display_picture, :gallery, :description, :social_media)
    end

end
