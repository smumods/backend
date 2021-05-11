ActiveAdmin.register Professor do
    permit_params :id, :name, :bookmarks_count, :slug

    index download_links: proc{ current_admin_user.admin? } do
        column :id
        column :name
        column :bookmarks_count
        column :slug
        column :additional_data
        column :created_at
        column :updated_at
        actions
    end
    
    csv do
        column :id
        column :name
        column :bookmarks_count
        column :slug
        column :additional_data
        column :created_at
        column :updated_at
    end
    
end
