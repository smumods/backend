ActiveAdmin.register_page "Leaderboard" do
    content do
        render 'users', { 
            all_users: Review.select(:user).group(:user).order("count_user DESC").count,
            filtered_users: Review.select(:user).group(:user).order("count_user DESC").where("reviews.created_at >= ? and reviews.created_at <= ?", "2020/06/15".to_date, "2020/06/28".to_date).count,
            reviews_count: Review.count,
            books_count: Book.count
        }
    end
end