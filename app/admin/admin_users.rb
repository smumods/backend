ActiveAdmin.register AdminUser do
  before_action :check_if_admin
  
  controller do
    def check_if_admin
      redirect_back(fallback_location: admin_root_path, notice: "You have to be an admin to see this page") unless current_admin_user.admin?
    end
  end

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
