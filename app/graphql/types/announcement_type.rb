module Types
  class AnnouncementType < Types::BaseObject
    field :title, String, null: true
    field :position, Integer, null: true
    field :target_link, Integer, null: true
    field :is_direct_link, Integer, null: true
    field :description, String, null: true
    field :main_image, String, null: true
    field :additional_images, [String], null: true
    field :valid_from, Types::DateTimeType, null: true
    field :expires_on, Types::DateTimeType, null: true 

    # def additional_images
    #   self.object.additional_images
    # end
  end
end
