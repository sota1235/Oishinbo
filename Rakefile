require 'rake'
require 'sinatra/activerecord/rake'
require 'coffeelint'

task :default => [:test, :coffee_lint]

task :test do
  puts "It's test!"
end

task :coffee_lint do
  success = Coffeelint.run_test_suite 'assets/javascripts'
  fail 'Coffeelint!' unless success
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
