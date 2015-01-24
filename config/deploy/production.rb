set :stage, :production
set :branch, :master
set :deploy_user, 'mohammad'

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_to, "/home/#{fetch(:deploy_user)}/www/#{fetch(:full_app_name)}"

set :chruby_ruby, 'ruby-2.1.5'

set :puma_threads, [2, 4]
set :puma_workers, 2
set :puma_bind, -> {"unix://#{shared_path}/tmp/sockets/#{fetch(:application)}_puma.sock"}
set :puma_state, -> {"#{shared_path}/tmp/pids/puma.state"}
set :puma_pid, -> {"#{shared_path}/tmp/pids/puma.pid"}
set :puma_access_log, -> {"#{release_path}/log/puma.error.log"}
set :puma_error_log, -> {"#{release_path}/log/puma.access.log"}
set :puma_preload_app, true
set :puma_worker_timeout, 30
set :puma_role, :app
set :puma_env, :production


server 'url.abushady.com',
       user: fetch(:deploy_user),
       roles: %w{web app},
       ssh_options: {
           forward_agent: true,
           auth_methods: %w(publickey)
       }
