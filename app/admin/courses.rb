ActiveAdmin.register Course do
    index download_links: proc{ current_admin_user.admin? } do
        column :id
        column :name
        column :career
        column :grading_basis
        column :course_components
        column :campus
        column :academic_group
        column :academic_organization
        column :module_code
        column :credit_units
        column :description
        column :term
        column :academic_group_abbreviation
        column :module_code_front
        column :created_at
        column :updated_at
        column :bookmarks_count
        actions
    end

    csv do 
        column :id
        column :name
        column :career
        column :grading_basis
        column :course_components
        column :campus
        column :academic_group
        column :academic_organization
        column :module_code
        column :credit_units
        column :description
        column :term
        column :academic_group_abbreviation
        column :module_code_front
        column :created_at
        column :updated_at
        column :bookmarks_count
    end

end
