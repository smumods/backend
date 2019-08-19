module Mutations
    module TemporaryUsers
        class CreateTemporaryUser < Mutations::BaseMutation
            # return type from the mutation
            type Types::TemporaryUserType

            def resolve()
                TemporaryUser.create!()
            end
        end
    end
end
