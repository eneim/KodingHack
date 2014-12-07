require 'rvm1/capistrano3'
require 'whenever/capistrano'

lock '3.2.1'

set :application, 'my-app'
set :repo_url, 'https://github.com/tmiyamon/my-app.git'
set :deploy_to, '/home/tmiyamon/production.tmiyamon.koding.io/'
set :keep_releases, 5

set :rvm_type, :system
set :rvm1_ruby_version, '2.1.5'

set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
