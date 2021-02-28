ActiveAdmin.register Review do
    permit_params :user_id, :course_id, :professor_id, :professor_review, :module_review, :type_of_review, :is_anonymous, :marking_score, :engagement_score, :fairness_score, :workload_score

    # Prevent non admins from deleting users
    disallowed_actions = [:edit]
    actions :all, except: disallowed_actions

    index download_links: proc{ current_admin_user.admin? } do
        column :professor_id
        column :user
        column :user_id
        column :course
        column :professor
        column :professor_review
        column :module_review
        column :type_of_review
        column :is_anonymous
        column :marking_score
        column :engagement_score
        column :fairness_score
        column :workload_score
        column :course_id
        actions
    end
    
    csv do
        column :professor_id
        column :user
        column :user_id
        column :course
    end

    form do |f|
        f.inputs do
            f.input :user, collection: User.all.collect{ |user| [user.email, user.id] }
            f.input :course, as: :select, collection: Course.all.pluck(:term, :module_code, :name, :id).collect { |course| ["[#{course[0]}] #{course[1]} - #{course[2]}", course[3]] }, input_html: { class: "select2" }
            f.input :professor, as: :select, collection: Professor.all.pluck(:slug, :name, :id).collect { |prof| ["[#{prof[0]}] #{prof[1]}", prof[2]] }, input_html: { class: "select2" }
            f.input :professor_review
            f.input :module_review
            f.input :type_of_review, collection: ["mod", "prof"]
            f.input :is_anonymous
            f.input :marking_score
            f.input :engagement_score
            f.input :fairness_score
            f.input :workload_score
        end
        f.actions
    end
    
    controller do
        def create
            @review = Review.new(permitted_params[:review])
            @review.save(validate: false)
            redirect_back(fallback_location: new_admin_review_path)
        end

        def update
            @review = Review.find(permitted_params[:id])
            @review.assign_attributes(permitted_params[:review])
            @review.save(validate: false)
            redirect_back(fallback_location: edit_admin_review_path(@review))
        end
    end
end
