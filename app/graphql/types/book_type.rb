module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :user, Types::UserType, null: false
    field :authors, [String], null: false
    field :isbn10, String, null: false
    field :isbn13, String, null: false
    field :is_used, Boolean, null: false
    field :price, Float, null: false
    field :description, String, null: false
    field :photos, [String], null: false
    # field :is_telegram_contact, String, null: false
    field :is_sold, Boolean, null: false
    field :course, Types::CourseType, null: false
    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false
  end
end
