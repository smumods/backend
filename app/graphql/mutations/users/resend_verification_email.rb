module Mutations
    module Users
        class ResendVerificationEmail < Mutations::BaseMutation
            null true

            # Arguments
            argument :email, String, required: true
            
            # return type from the mutation
            field :success, String, null: false

            def resolve(email:)
                nil
            end
        end
    end
end