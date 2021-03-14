ActiveAdmin.register Professor do
    permit_params :id, :name, :bookmarks_count, :slug

    index download_links: proc{ current_admin_user.admin? } do
        column :id
        column :name
        column :bookmarks_count
        column :slug
        actions
    end
    
    csv do
        column :id
        column :name
        column :bookmarks_count
        column :slug
    end
    
end
