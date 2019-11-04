module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :books, [Types::BookType], null: true
    field :books_count, Integer, null: true
    field :all_votes, [Types::VoteType], null: true
    field :all_reviews, [Types::ReviewType], null: true
    field :course_bookmarks, [Types::CourseType], null: true
    field :professor_bookmarks, [Types::ProfessorType], null: true

    def id
      self.object.uuid
    end

    def books_count
      books.size
    end

    def all_votes
      self.object.votes
    end

    def all_reviews
      current_user = context[:current_user]
      if current_user.nil?
        self.object.reviews.where(is_anonymous: false)
      else
        self.object.reviews.where(is_anonymous: false).or(current_user.reviews)
      end
    end

    def course_bookmarks
      self.object.bookmark_courses.uniq
    end

    def professor_bookmarks
      self.object.bookmark_professors
    end
  end
end
