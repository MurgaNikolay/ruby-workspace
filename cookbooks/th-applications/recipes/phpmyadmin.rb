#deploy phpmyadmin
#::Chef::Node.send(:include, Opscode::ThApplications::Helpers)

include_recipe 'th-applications'


application = node['application']['phpmyadmin']
application application['application_name'] do
  path application['path']
  repository application['repository']
  revision application['revision']
  before_restart do
    FileUtils.mkdir_p "#{application['path']}/current/conf/config.inc.php-dist" "#{application['path']}/current/conf/config.inc.php"
  end
end

nginx_app application['application_name'] do
  appliction_name         application['application_name']
  doc_root                File.join application['path'], 'current'
  server_name             Opscode::ThApplications::Helpers.server_name(node,  application)
  template                'fastcgi_load_ballancer.conf.erb'
  application_sockets     application['socket']
end

php_fpm_pool application['application_name'] do
  listen Array(application['socket']).first
end
