require 'rubygems'
require 'json'

# Load constants from rake config file.
require File.join(File.dirname(__FILE__), 'config', 'rake')

task :solo, :node do |_, args|
  system 'berks --path vendor'
  system "chef-solo -c .chef/solo.rb -j #{args[:node]}"
end
