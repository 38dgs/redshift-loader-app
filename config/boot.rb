# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

# Make sure logs aren't buffered
Padrino::Logger::Config[:production][:log_level] = :info
Padrino::Logger::Config[:production][:auto_flush] = :true
Padrino::Logger::Config[:production][:stream] = :stdout

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!

Delayed::Worker.logger = Logger.new(STDOUT)
Delayed::Worker.destroy_failed_jobs = false