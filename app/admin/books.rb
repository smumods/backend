ActiveAdmin.register Book do
    index download_links: proc{ current_admin_user.admin? } do
        column :id
        column :title
        column :user_id
        column :created_at
        column :updated_at
        column :authors
        column :isbn10
        column :is_used
        column :price
        column :description
        column :photos
        column :is_telegram_contact
        column :is_sold
        column :course_id
        column :isbn13
        column :bookmarks_count
        column :uuid
        actions
    end

    csv do 
        column :id
        column :title
        column :user_id
        column :created_at
        column :updated_at
        column :authors
        column :isbn10
        column :is_used
        column :price
        column :description
        column :photos
        column :is_telegram_contact
        column :is_sold
        column :course_id
        column :isbn13
        column :bookmarks_count
        column :uuid
    end
end