ActiveAdmin.register User do
  # Prevent non admins from deleting users
  disallowed_actions = [:destroy]
  actions :all, except: disallowed_actions

  if Rails.env.staging? or Rails.env.development?
    permit_params :password_reset_tries_count, :password_token_tries_count, :verified
  else
    permit_params :password_reset_tries_count, :password_token_tries_count
  end

  index download_links: proc{ current_admin_user.admin? } do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    column :updated_at
    column :encrypted_password
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :first_name
    column :last_name
    column :authentication_token
    column :authentication_token_created_at
    column :verified
    if Rails.env.staging? or Rails.env.development?
      column :email_token
      column :verification_count
    end
    column :uuid
    column :password_reset_token
    column :password_reset_token
    column :password_reset_tries_count
    column :password_token_tries_count
    column :telegram_id
    column :telegram_username
    column :telegram_picture
    actions
  end

  csv do 
    column :id
    column :email
    column :name
    column :created_at
    column :updated_at
    column :encrypted_password
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :first_name
    column :last_name
    column :authentication_token
    column :authentication_token_created_at
    column :verified
    column :email_token
    column :uuid
    column :password_reset_token
    column :password_reset_token
    column :password_reset_tries_count
    column :password_token_tries_count
    column :telegram_id
    column :telegram_username
    column :telegram_picture
    column :verification_count
  end

  filter :email
  filter :password_reset_tries_count
  filter :password_token_tries_count
  filter :verified
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :email, as: :readonly
      f.input :first_name, as: :readonly
      f.input :last_name, as: :readonly
      if Rails.env.staging? or Rails.env.development?
        f.input :verified
        f.input :email_token
        f.input :verification_count
      else
        f.input :verified, as: :readonly
      end
      f.input :password_reset_tries_count
      f.input :password_token_tries_count
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :uuid
      row :email
      row :first_name
      row :last_name
      row :verified
      if Rails.env.staging? or Rails.env.development?
        row :email_token
        row :verification_count
      end
      row :password_reset_tries_count
      row :password_token_tries_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
