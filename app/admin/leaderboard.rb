ActiveAdmin.register_page "Leaderboard" do
    content do
        render 'users', { 
            users: Review.select(:user).group(:user).order("count_user DESC").count,
            reviews_count: Review.count,
            books_count: Book.count
        }

    end
end