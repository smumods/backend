# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( application.js application.css )

Rails.application.config.assets.precompile += ["pages.coffee", "pages.sass"]
Rails.application.config.assets.precompile += ["events.coffee", "events.scss"]
Rails.application.config.assets.precompile += ["clubs.coffee", "clubs.scss"]

# controllers = Rails.application.routes.routes.map do |route|
#     route.defaults[:controller]
#     binding.pry
# end.uniq
# controllers.each do |controller|
#     binding.pry
#     Rails.application.config.assets.precompile += ["#{controller}.coffee", "#{controller}.scss"]
# end
