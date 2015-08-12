# coding: utf-8
require 'rake'
require 'sinatra/activerecord/rake'

task :default => 'test'

task :test do
  puts "It's test!"
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
