source "https://rubygems.org"

gem "rails", "~> 7.2.0"
gem "sqlite3", ">= 1.4"

group :production do
  gem "pg", "1.3.5"
end

gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "rack-cors"


group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'bcrypt', '~> 3.1.20' # バージョンを更新
  gem 'jwt'
end

# gem "image_processing", "~> 1.2" # 必要に応じてコメントアウトを解除