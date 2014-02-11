require 'rubygems'
require 'json'

# Load constants from rake config file.
require File.join(File.dirname(__FILE__), 'config', 'rake')

task :default do

end

task :solo, :node do |_, args|
  system 'berks --path vendor'
  system "sudo chef-solo -c .chef/solo.rb -j nodes/#{args[:node]}.json"
end
