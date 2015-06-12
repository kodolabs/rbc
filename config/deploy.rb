require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string,       'ruby-1.9.3-p125'
set :rvm_type,              :user

set :application,           'railskickstart'
set :domain,                'upscript.com'
set :repository,            'git@github.com:kodolabs/rbc.git'
set :rails_env,             :production

default_run_options[:pty] = true
ssh_options[:paranoid]    = false

set :scm, "git"

set :user,                  'upscript'
set :runner,                'upscript'
set :use_sudo,              false

set :deploy_to,             '/home/upscript/domains/railskickstart'
set :branch,                'master'
set :deploy_via,            :remote_cache

set :unicorn_conf,          "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid,           "#{deploy_to}/shared/pids/unicorn.pid"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

# Create uploads directory and link
task :configure, :roles => :app do
  run "ln -s #{shared_path}/config/config.yml #{release_path}/config/config.yml"
end

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end

before 'deploy:finalize_update', 'configure'
after 'deploy:update', 'deploy:cleanup'

