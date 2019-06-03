module Mutations
    class Users::CreateTemporaryUser < Mutations::BaseMutation
        # return type from the mutation
        type Types::TemporaryUserType

        def resolve()
            TemporaryUser.create!()
        end
    end
end