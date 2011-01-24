$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'thinking_sphinx/deploy/capistrano'
set :application, "WriteIdeally"
set :repository,  "git@github.com:joshmcarthur/WriteIdeally.git"
set :rvm_ruby_string, '1.9.2@writeideally'


set :deploy_to, "/var/rails/writeideally"
set :scm, :git
set :user, "deployer"
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enabled_submodules, 1

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "173.230.146.234"                          # Your HTTP server, Apache/etc
role :app, "173.230.146.234"                          # This may be the same as your `Web` server
role :db,  "173.230.146.234", :primary => true # This is where Rails migrations will run



namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end

  desc "Link up Sphinx's indexes."
  task :symlink_sphinx_indexes, :roles => [:app] do
    run "ln -nfs #{shared_path}/system/db/sphinx #{release_path}/db/sphinx"
  end

  task :activate_sphinx, :roles => [:app] do
    symlink_shared_files
    symlink_sphinx_indexes
    thinking_sphinx.configure
    thinking_sphinx.start
  end

  task :symlink_shared_files, :roles => [:app] do
    run "ln -nfs #{shared_path}/system/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system/tokens.rb #{release_path}/config/initializers/tokens.rb"
    run "ln -nfs #{shared_path}/system/ckeditor_assets #{release_path}/public/ckeditor_assets"
  end

  before 'deploy:update_code', 'thinking_sphinx:stop'
  after 'deploy:update_code', 'deploy:activate_sphinx'
end

