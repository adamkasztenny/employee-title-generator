require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :start do
	exec("ruby app/controller/controller.rb -p 8080")
end
