require 'rake'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'coffeelint'

task :default => [:coffee_lint, :spec]

desc 'Run all specs'
RSpec::Core::RakeTask.new :spec

desc 'Run model unit specs'
RSpec::Core::RakeTask.new 'spec:unit:models' do |t|
  t.pattern = 'spec/unit/models/*_spec.rb'
end

desc 'Run service unit specs'
RSpec::Core::RakeTask.new 'spec:unit:services' do |t|
  t.pattern = 'spec/unit/services/*_spec.rb'
end

desc 'Run integration specs'
RSpec::Core::RakeTask.new 'spec:integration' do |t|
  t.pattern = 'spec/integration/*_spec.rb'
end

desc 'Run coffee lint'
task :coffee_lint do
  success = Coffeelint.run_test_suite 'assets/javascripts'
  fail 'Coffeelint!' unless success
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
