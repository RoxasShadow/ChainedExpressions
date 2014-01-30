#! /usr/bin/env ruby
require 'rake'

task :default => [ :install, :test ]

task :install do
  sh 'gem build   *.gemspec'
  sh 'gem install *.gem'
end

task :test do
  FileUtils.cd 'tests' do
    sh 'rspec chainedexpressions_spec.rb --backtrace --color --format doc'
  end
end