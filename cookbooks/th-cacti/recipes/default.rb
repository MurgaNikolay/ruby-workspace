settings = Cacti.settings(node)

include_recipe 'apt' if node['platform'] == 'ubuntu'
include_recipe 'yum-epel' if node['platform_family'] == 'rhel'
include_recipe 'mysql::client'
include_recipe 'cacti::package'
include_recipe 'th-cacti::database' if settings['database']['host'] == 'localhost'
include_recipe 'cacti::configuration'
include_recipe 'th-cacti::nginx' if settings['web']['install_method'] == 'nginx'
include_recipe 'cacti::apache' if settings['web']['install_method'] == 'apache'
include_recipe 'cacti::cron'