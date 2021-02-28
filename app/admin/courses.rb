ActiveAdmin.register Course do
    index download_links: proc{ current_admin_user.admin? } do
        column :id
        column :name
        column :career
        column :module_code
        column :description
        column :term
        column :bookmarks_count
        actions
    end
end
