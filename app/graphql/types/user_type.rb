module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :books, [Types::BookType], null: true
    field :books_count, Integer, null: true
    field :all_votes, [Types::VoteType], null: true
    field :all_reviews, [Types::ReviewType], null: true

    def books_count
      books.size
    end

    def all_votes
      self.object.votes
    end

    def all_reviews
      self.object.reviews
    end
  end
end
