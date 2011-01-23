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

after :deploy, "symlink"

task :before_update_code, :roles => [:app] do
  thinking_sphinx.stop
end

task :after_update_code, :roles => [:app] do
  symlink_sphinx_indexes
  thinking_sphinx.configure
  thinking_sphinx.start
  symlink_shared_files
end

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

task :symlink_shared_files do
  run "#{try_sudo} ln -s #{File.join(shared_path, 'system', 'ckeditor_assets')} #{File.join(current_path, 'public', 'ckeditor_assets')}"
  run "#{try_sudo} ln -s #{File.join(shared_path, 'system', 'database.yml')} #{File.join(current_path, 'config', 'database.yml')}"
end

task :symlink_sphinx_indexes, :roles => [:app] do
  run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
end

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end
end

