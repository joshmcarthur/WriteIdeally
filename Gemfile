source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'haml'
gem 'jquery-rails'
gem 'devise', :git => 'https://github.com/plataformatec/devise.git', :branch => 'v1.2.oauth'
gem 'oauth2'
gem 'grape'
gem 'will_paginate'
gem 'ckeditor'
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'thinking-sphinx', '2.0.0', :require => 'thinking_sphinx'
gem 'memcache-client'

group(:production) do
  gem 'pg'
end

group(:development, :test) do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'autotest-rails'
  gem 'ruby-debug19'
  gem 'heroku'
end
