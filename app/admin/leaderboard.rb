ActiveAdmin.register_page "Leaderboard" do
    content do
        render 'users', { 
            users: Review.select(:user).group(:user).count
        }
    end
end