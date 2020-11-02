ActiveAdmin.register Announcement do
  permit_params :title, :description, :main_image, :valid_from, :expires_on, :additional_images, :is_direct_link, :target_link

  # Orderable
  include ActiveAdmin::SortableTable
  config.sort_order = 'position_asc'

  index do
    handle_column
    selectable_column
    id_column
    column :title
    column :is_direct_link
    column :target_link
    column :valid_from
    column :expires_on
    column :created_at
    column :updated_at
    actions
  end

  filter :valid_from
  filter :expires_on
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :is_direct_link
      f.input :target_link
      f.input :description
      f.input :main_image
      f.input :additional_images, as: :tags
      f.input :valid_from, as: :date_time_picker
      f.input :expires_on, as: :date_time_picker
    end
    f.actions
  end

  controller do
    def create
      @announcement = Announcement.new({
        title: params[:announcement][:title],
        is_direct_link: params[:announcement][:is_direct_link],
        target_link: params[:announcement][:target_link],
        description: params[:announcement][:description],
        main_image: params[:announcement][:main_image],
        valid_from: params[:announcement][:valid_from],
        expires_on: params[:announcement][:expires_on]
      })
      additional_images = permitted_params[:announcement][:additional_images].split(",")
      @announcement[:additional_images] = additional_images
      if @announcement.save
        redirect_back(fallback_location: edit_admin_announcement_path(@announcement), notice: "Saved!")
      else
        redirect_back(fallback_location: new_admin_announcement_path, alert: "Error creating announcement! #{@announcement.errors.full_messages.join(", ")}")
      end
    end
    
    def update
      @announcement = Announcement.find(permitted_params[:id])
      @announcement.assign_attributes({
        title: params[:announcement][:title],
        is_direct_link: params[:announcement][:is_direct_link],
        target_link: params[:announcement][:target_link],
        description: params[:announcement][:description],
        main_image: params[:announcement][:main_image],
        valid_from: params[:announcement][:valid_from],
        expires_on: params[:announcement][:expires_on]
      })
      additional_images = permitted_params[:announcement][:additional_images].split(",")
      if @announcement.update(additional_images: additional_images)
        redirect_back(fallback_location: edit_admin_announcement_path(@announcement), notice: "Saved!")
      else
        redirect_back(fallback_location: edit_admin_announcement_path(@announcement), alert: "Error updating announcement! #{@announcement.errors.full_messages.join(", ")}")
      end
    end
  end
end
