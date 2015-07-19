workers 2
threads 8, 16

preload_app!

rackup      DefaultRackup
environment ENV['LOTUS_ENV'] || 'development'
bind        "unix://tmp/sockets/puma.sock"
