require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rake/packagetask'
require 'rubygems/package_task'



begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "openurl"
    gemspec.summary = "a Ruby library to create, parse and use NISO Z39.88 OpenURLs"
    gemspec.email = ["rochkind@jhu.edu", "rossfsinger@gmail.com"]
    gemspec.homepage = "https://github.com/openurl/openurl"
    gemspec.authors = ["Jonathan Rochkind", "Ross Singer"]
    gemspec.files = Dir.glob("{lib,test}/**/*")
    gemspec.require_path = 'lib'
    gemspec.has_rdoc = true    
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

Rake::TestTask.new('test') do |t|
  t.libs << 'lib'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
  t.ruby_opts = ['-r openurl', '-r test/unit']
end

Rake::RDocTask.new('doc') do |rd|
  rd.rdoc_files.include("lib/**/*.rb")
  rd.rdoc_files.include("README")
  rd.rdoc_files.include("Changes")
  rd.main = 'README'
  rd.options << "--all"
  rd.rdoc_dir = 'doc'
end
