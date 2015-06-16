lock '3.3.5'

set :application, 'rails4_start'
set :repo_url, 'https://github.com/free1/Rails4-Start-Up.git'

set :deploy_user, "deploy"
set :use_sudo, false
set :user, "deploy"

# role
set :filter, :roles => %w{app web db}

# rbenv
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.2'
# # in case you want to set ruby version from the file:
# # set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# asset migrate
set :migration_role, 'db'
set :assets_roles, [:web, :app]

# unicorn
set :unicorn_config_path, "config/unicorn.rb"
set :unicorn_roles, [:web, :app]
set :unicorn_rack_env, "production"

# set :rails_env, :production

set :stage, :production

# Default branch is :master
set :branch, "master"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:application)}"

set :default_stage, "production"
# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/application.yml config/thinking_sphinx.yml}
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :bundle_binstubs, nil
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# whenever
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles,        ->{ :db }

# thinking_sphinx
set :thinking_sphinx_roles, :db
set :thinking_sphinx_rails_env, -> { fetch(:rails_env) || fetch(:stage) }

# sidekiq
set :sidekiq_pid, "./tmp/pids/sidekiq.pid"
set :sidekiq_log, "log/sidekiq.log"

before 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

# # god
# namespace :god do
#   def god_is_running
#     capture(:bundle, "exec god status > /dev/null 2>&1 || echo 'god not running'") != 'god not running'
#   end
 
#   # Must be executed within SSHKit context
#   # 暂时只监控unicorn，nginx由monit监控
#   def config_file
#     "#{release_path}/config/god/unicorn.god"
#   end
 
#   # Must be executed within SSHKit context
#   def start_god
#     execute :bundle, "exec god -c #{config_file}"
#   end
 
#   desc "Start god and his processes"
#   task :start do
#     on roles(:web) do
#       within release_path do
#         with RAILS_ENV: fetch(:rails_env) do
#           start_god
#         end
#       end
#     end
#   end
 
#   desc "Terminate god and his processes"
#   task :stop do
#     on roles(:web) do
#       within release_path do
#         if god_is_running
#           execute :bundle, "exec god terminate"
#         end
#       end
#     end
#   end
 
#   desc "Restart god's child processes"
#   task :restart do
#     on roles(:web) do
#       within release_path do
#         with RAILS_ENV: fetch(:rails_env) do
#           if god_is_running
#             execute :bundle, "exec god load #{config_file}"
#             execute :bundle, "exec god restart"
#           else
#             start_god
#           end
#         end
#       end
#     end
#   end
# end
