# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

if ENV['RAILS_ENV'] == 'development'
  Rails.application.load_tasks
  RSpec::Core::RakeTask.new(:unit) do |t|
  	t.rspec_opts = "--tag unit"
  end
end

