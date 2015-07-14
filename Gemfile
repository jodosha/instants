source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'panther', git: 'git@github.com:jodosha/panther.git'

gem 'lotus-utils',       require: false, github: 'lotus/utils'
gem 'lotus-router',      require: false, github: 'lotus/router'
gem 'lotus-validations', require: false, github: 'lotus/validations'
gem 'lotus-helpers',     require: false, github: 'lotus/helpers'
gem 'lotus-controller',  require: false, github: 'lotus/controller'
gem 'lotus-view',        require: false, github: 'lotus/view'
gem 'lotus-model',       require: false, github: 'lotus/model'
gem 'lotus-assets',      require: false, path: '../lotus/assets'
gem 'lotusrb',                           path: '../lotus/lotus'

group :development do
  gem 'byebug', require: false
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
