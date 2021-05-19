source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Preinstalled/Base
gem 'rails', '~> 6.0.0'                                       # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '>= 0.18', '< 2.0'                                  # Use postgresql as the database for Active Record
gem 'puma', '~> 4.3'                                          # Use Puma as the app server
gem 'redis', '~> 4.0'                                         # Use Redis adapter to run Action Cable in production
gem 'bootsnap', '>= 1.4.2', require: false                    # Reduces boot times through caching; required in config/boot.rb
gem 'rack-cors'                                               # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
gem 'mini_racer', platforms: :ruby                            # Embed V8 in Ruby environment
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Specified
gem 'active_model_serializers', '~> 0.10.0'                   # Serialization for ActiveModel
gem 'acts_as_paranoid', '~> 0.6.0'                            # Soft delete for ActiveRecord
gem 'devise_token_auth'                                       # Token-based user authentication via API
gem 'kaminari'                                                # Pagination for collections
gem 'sidekiq'                                                 # Job backgrounding


# Environment Specific
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]         # Debugger for step/break/eval/track
  gem 'factory_bot'                                           # Seed data generator
  gem 'figaro'                                                # Environment variables in dev and test
  gem 'rspec-activemodel-mocks'                               # Testing mocks
  gem 'rspec-rails', '~> 3.6'                                 # Testing platform
  gem 'rspec-retry'                                           # Testing retry logic
end

group :development do
  gem 'better_errors'                                         # Improved error page with console
  gem 'binding_of_caller'                                     # Binding for error console (dependency of better_errors)
  gem 'letter_opener'                                         # Capture mail in browser
  gem 'listen', '>= 3.0.5', '< 3.2'                           # Listen for file modifications
  gem 'spring'                                                # Keep aplication running in background
  gem 'spring-watcher-listen', '~> 2.0.0'                     # Watcher process for Spring
  gem 'web-console', '>= 3.3.0'                               # Rails console in browser
end
