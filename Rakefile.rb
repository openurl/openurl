# 
# Rakefile.rb
# 
# Created on Oct 29, 2007, 3:12:35 PM
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
RUBY_OPENURL_VERSION = '0.0.2'

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'

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

spec = Gem::Specification.new do |s|
  s.name = 'openurl'
  s.version = RUBY_OPENURL_VERSION
  s.author = 'Ross Singer'
  s.email = 'rossfsinger@gmail.com'
  s.homepage = 'http://openurl.rubyforge.org/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'a Ruby library to create, parse and use NISO Z39.88 OpenURLs'
  s.files = Dir.glob("{lib,test}/**/*")
  s.require_path = 'lib'
  s.autorequire = 'openurl'
  s.has_rdoc = true
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end