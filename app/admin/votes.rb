ActiveAdmin.register Vote do
    index download_links: proc{ current_admin_user.admin? } do
        column :vote_type
        column :review_type
        column :user_id
        column :review_id
        column :created_at
        column :updated_at
        actions
    end

    csv do 
        column :vote_type
        column :review_type
        column :user_id
        column :review_id
        column :created_at
        column :updated_at
    end
end