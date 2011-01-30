require 'rubygems'
require 'bundler'
require File.expand_path('../lib/flixated/version', __FILE__)
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "flixated"
  gem.homepage = "http://github.com/anthonator/flixated"
  gem.license = "MIT"
  gem.summary = 'Netflix OAuth REST API client library for Ruby'
  gem.email = "anthony@sticksnleaves.com"
  gem.authors = ["Anthony Smith"]
  gem.version = Flixated::VERSION
  gem.files = Dir.glob('lib/**/*')
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  
  gem.add_development_dependency 'rspec',   '~> 2.4.0'
  gem.add_development_dependency 'bundler', '~> 1.0.0'
  gem.add_development_dependency 'jeweler', '~> 1.5.2'
  gem.add_development_dependency 'rcov',    '>= 0'
  gem.add_development_dependency 'yard',    '>= 0.6.4'
  
  gem.add_runtime_dependency 'oauth',      '~> 0.4.4'
  gem.add_runtime_dependency 'yajl-ruby',  '~> 0.7.9'
  gem.add_runtime_dependency 'multi_xml',  '~> 0.2.0'
  gem.add_runtime_dependency 'hashie',     '~> 1.0.0'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "flixated #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
