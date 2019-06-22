module Types
  class BookType < Types::BaseObject
    field :title, String, null: false
    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false
  end
end
