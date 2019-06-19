module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :books, [Types::BookType], null: true
    field :books_count, Integer, null: true

    def books_count
      books.size
    end
  end
end
