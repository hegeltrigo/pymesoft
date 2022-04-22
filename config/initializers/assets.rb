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
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
#Rails.application.config.assets.precompile += %w(*.js *.css )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

Rails.application.config.assets.configure do |env|
  env.cache = Sprockets::Cache::FileStore.new(
    ENV.fetch("SPROCKETS_CACHE", "#{env.root}/tmp/cache/assets"),
    Rails.application.config.assets.cache_limit,
    env.logger
  )
end