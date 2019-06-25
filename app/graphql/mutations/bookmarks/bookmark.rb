module Mutations
    module Bookmarks
        class Bookmark < Mutations::BaseMutation
            null true

            argument :bookmark_type, String, required: true
            argument :resource_id_or_slug, String, required: true

            type Types::UserType

            def resolve(bookmark_type:, resource_id_or_slug:)
                current_user = context[:current_user]
                if context[:current_user].blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                end
                return if current_user.nil?
                return if not ["mod", "prof"].include? bookmark_type
                case bookmark_type
                when "mod"  
                    course = Course.latest_course(resource_id_or_slug.upcase)
                    return if course.nil?
                    if current_user.bookmark_course? course
                        current_user.destroy_action(:bookmark, target: course)
                    else
                        current_user.create_action(:bookmark, target: course)
                    end
                when "prof"
                    professor = Professor.find(resource_id_or_slug)
                    return if professor.nil?
                    if current_user.bookmark_professor? professor
                        current_user.destroy_action(:bookmark, target: professor)
                    else
                        current_user.create_action(:bookmark, target: professor)
                    end
                else
                    return
                end
                current_user
            end
        end
    end
end