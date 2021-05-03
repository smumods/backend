ActiveAdmin.register ProfessorCourse do
    permit_params :id, :professor_id, :course_id, :created_at, :updated_at # add any attributes you want

    index download_links: proc{ current_admin_user.admin? } do # downalod
        column :id
        column :professor_id
        column :course_id
        column :created_at
        column :updated_at
        actions
    end
    
    csv do
        column :id
        column :professor_id
        column :course_id
        column :created_at
        column :updated_at
    end
    
end
