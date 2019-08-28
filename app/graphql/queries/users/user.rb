module Queries
    module Users
        class User < Queries::BaseQuery
            description 'Return an individual user using user session'

            type Types::UserType, null: false

            def resolve()
              current_user = context[:current_user]
              if current_user.blank?
                  raise GraphQL::ExecutionError.new("Authentication required")
              end
              return current_user
            end
        end
    end
end
