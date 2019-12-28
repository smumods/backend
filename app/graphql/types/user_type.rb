module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :telegram_id, Integer, null: true
    field :telegram_username, String, null: true
    field :telegram_picture, String, null: true
    field :books, [Types::BookType], null: true
    field :books_count, Integer, null: true
    field :all_votes, [Types::VoteType], null: true
    field :all_books, [Types::BookType], null: true
    field :all_reviews, [Types::ReviewType], null: true
    field :course_bookmarks, [Types::CourseType], null: true
    field :professor_bookmarks, [Types::ProfessorType], null: true
    field :book_bookmarks, [Types::BookType], null: true

    def id
      self.object.uuid
    end

    def telegram_id
      current_user = context[:current_user]
      # only return this IF 2 conditions are met: (1) user is logged in (2) user object still has books to sell
      all_user_books_sold = self.object.books.collect(&:is_sold).reduce(&:&)
      if current_user and not all_user_books_sold
        self.object.telegram_id
      else
        nil
      end
    end

    def telegram_username
      current_user = context[:current_user]
      all_user_books_sold = self.object.books.collect(&:is_sold).reduce(&:&)
      if current_user and not all_user_books_sold
        self.object.telegram_username
      else
        nil
      end
    end
    
    def telegram_picture
      current_user = context[:current_user]
      all_user_books_sold = self.object.books.collect(&:is_sold).reduce(&:&)
      if current_user and not all_user_books_sold
        self.object.telegram_picture
      else
        nil
      end
    end

    def books_count
      books.size
    end

    def all_votes
      self.object.votes
    end
    
    def all_books
      self.object.books
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
    
    def book_bookmarks
      self.object.bookmark_books
    end
  end
end
