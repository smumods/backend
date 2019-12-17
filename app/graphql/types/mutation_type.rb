module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :login_user, mutation: Mutations::Users::LogInUser
    field :logout_user, mutation: Mutations::Users::LogOutUser
    field :verify_email, mutation: Mutations::Users::VerifyEmail
    field :add_telegram, mutation: Mutations::Users::AddTelegram
    field :forget_password, mutation: Mutations::Users::ForgetPassword
    field :reset_password, mutation: Mutations::Users::ResetPassword
    field :vote, mutation: Mutations::Votes::Vote
    field :create_review, mutation: Mutations::Reviews::CreateReview
    field :edit_review, mutation: Mutations::Reviews::EditReview
    field :delete_review, mutation: Mutations::Reviews::DeleteReview
    field :bookmark, mutation: Mutations::Bookmarks::Bookmark
    field :create_book, mutation: Mutations::Books::CreateBook
    field :edit_book, mutation: Mutations::Books::EditBook
    field :delete_book, mutation: Mutations::Books::DeleteBook
  end
end
