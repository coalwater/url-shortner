# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'url-shortner'
set :scm, :git
set :repo_url, 'git@github.com:coalwater/url-shortner.git'
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 5

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
end

namespace :deploy do

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse #{fetch :branch}` == `git rev-parse origin/#{fetch :branch}`
        puts "WARNING: #{fetch :branch} is not the same as origin/#{fetch :branch}".colorize :red
        puts 'Run `git push` to sync changes.'.colorize :red
        exit
      end
    end
  end

  before :deploy, 'deploy:check_revision'
  before :starting, 'puma:make_dirs'
  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :publishing, :restart
end
