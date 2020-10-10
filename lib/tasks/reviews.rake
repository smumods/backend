namespace :reviews do
  desc "Updates existing apps with module_code column in Reviews model"
  task add_module_code: :environment do
    Review.find_each(&:save)
  end

end
