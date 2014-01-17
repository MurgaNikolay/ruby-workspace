site :opscode


Dir.glob('cookbooks/*').select {|f| File.directory? f}.each do |directory|
    next if File.basename(directory)[0] == '_'
    cookbook File.basename(directory), path: directory
end

cookbook "zabbix", git: 'git@github.com:MurgaNikolay/zabbix.git'
cookbook "locale-gen", git: 'git@github.com:danhart/locale-gen.git'
cookbook "oh_my_zsh", git: 'git@github.com:shingara/oh-my-zsh-chef.git'
#cookbook "chef-rvm", git: 'git@github.com:fnichol/chef-rvm.git'
cookbook "user", git: 'git@github.com:MurgaNikolay/chef-user.git'
cookbook "users"
cookbook "chef-solo-search"
cookbook "cacti"
cookbook "ssl"
cookbook "rvm", git: 'git@github.com:fnichol/chef-rvm.git'

