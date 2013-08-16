listen "/var/www/binto.codedeck.com/shared/pids/unicorn.sock", :backlog => 64
listen 5000, :tcp_nopush => true
timeout 30

worker_processes 2

working_directory "/var/www/binto.codedeck.com/current"
rails_env = ENV['RAILS_ENV'] || 'production'

pid "/var/www/binto.codedeck.com/shared/pids/unicorn.pid"
stderr_path "/var/www/binto.codedeck.com/shared/log/unicorn.stderr.log"
stdout_path "/var/www/binto.codedeck.com/shared/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
