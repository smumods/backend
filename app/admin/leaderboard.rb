ActiveAdmin.register_page "Leaderboard" do
    content do
        render 'users', { 
            users: Review.select(:user).group(:user).count,
            reviews_count: Review.count,
            books_count: Book.count
        }

    end
end