module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :books, [Types::BookType], null: true
    field :books_count, Integer, null: true
    field :all_votes, [Types::VoteType], null: true
    field :all_reviews, [Types::ReviewType], null: true
    field :course_bookmarks, [String], null: true
    field :professor_bookmarks, [Int], null: true

    def books_count
      books.size
    end

    def all_votes
      self.object.votes
    end

    def all_reviews
      self.object.reviews
    end

    def course_bookmarks
      self.object.bookmark_courses.collect(&:module_code).uniq
    end

    def professor_bookmarks
      self.object.bookmark_professor_ids
    end
  end
end
