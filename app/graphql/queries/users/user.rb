module Queries
    module Users
        class User < Queries::BaseQuery
            description 'Return an individual user'
            
            argument :id, String, required: false

            type Types::UserType, null: false

            def resolve(id:)
                return ::User.find_by(uuid: id) if id.present?
                return context[:current_user] if context[:current_user].present?
                raise GraphQL::ExecutionError.new("You need a valid User ID or you must be logged in")
            end
        end
    end
end