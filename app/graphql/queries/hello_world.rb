module Queries
    class HelloWorld < Queries::BaseQuery
        description 'Hello World query to test if GraphQL works'
        
        type String, null: false

        def resolve
            "Hello Vera!"
        end
    end
end