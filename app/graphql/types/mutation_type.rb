module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_temporary_user, mutation: Mutations::Users::CreateTemporaryUser
    field :login_user, mutation: Mutations::Users::LogInUser
    field :logout_user, mutation: Mutations::Users::LogOutUser
    field :verify_email, mutation: Mutations::Users::VerifyEmail
    field :vote, mutation: Mutations::Votes::Vote
    field :create_review, mutation: Mutations::Reviews::CreateReview
    field :edit_review, mutation: Mutations::Reviews::EditReview
    field :delete_review, mutation: Mutations::Reviews::DeleteReview
    field :bookmark, mutation: Mutations::Bookmarks::Bookmark
  end
end
