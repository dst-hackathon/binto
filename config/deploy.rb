require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, :local
set :rvm_type, :user
before 'deploy:setup', 'rvm:create_gemset'

set :application, 'binto'
set :domain, 'binto.codedeck.com'
set :rails_env, 'production'

set :scm, :git
set :repository, 'git@github.com:dst-hackathon/binto.git'
set :branch, 'master'

set :user, 'deployer'
set :use_sudo, false
set :ssh_options, { :forward_agent => true }

set :deploy_to, "/var/www/#{domain}"
set :deploy_via, :remote_cache

role :web, domain
role :app, domain
role :db,  domain, :primary => true

namespace :deploy do
  after "deploy:update_code", :link_production_db
  after "deploy:update_code", :rake_tasks
  after "deploy:update_code", :update_share_folders
end

desc "Link in the production database"
task :link_production_db do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end

desc "Prerequisite Tasks"
task :rake_tasks do
  run "ln -nfs #{deploy_to}/shared/.ruby-version #{release_path}/.ruby-version"
  run "ln -nfs #{deploy_to}/shared/.ruby-gemset #{release_path}/.ruby-gemset"

  run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  run "cd #{release_path} && bundle exec rake assets:precompile"
end

task :update_share_folders do
  run "ln -nfs #{deploy_to}/shared/public/uploads #{release_path}/public/uploads"
end

# Needs to be placed after all hook. 
# See https://github.com/sosedoff/capistrano-unicorn
require 'capistrano-unicorn'
