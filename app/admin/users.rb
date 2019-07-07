ActiveAdmin.register User do
    permit_params :password_reset_tries_count, :password_token_tries_count
  
    index do
      selectable_column
      id_column
      column :email
      column :first_name
      column :last_name
      column :verified
      column :password_reset_tries_count
      column :password_token_tries_count
      column :created_at
      column :updated_at
      actions
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
        f.input :verified, as: :readonly
        f.input :password_reset_tries_count
        f.input :password_token_tries_count
      end
      f.actions
    end
  
  end
  