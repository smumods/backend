module Types
    class AuthProviderEmailInput < BaseInputObject
        graphql_name 'AUTH_PROVIDER_EMAIL'

        argument :email, String, required: true
        argument :password, String, required: true
        argument :first_name, String, required: true
        argument :last_name, String, required: true
    end
end