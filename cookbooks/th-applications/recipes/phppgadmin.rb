#deploy phpmyadmin
#::Chef::Node.send(:include, Opscode::ThApplications::Helpers)

include_recipe 'th-applications'
application = node['application']['phppgadmin']

application application['application_name'] do
  path application['path']
  repository application['repository']
  revision application['revision']
  #before_deploy do
  #  FileUtils.mkdir_p File.dirname(application['socket'])
  #end
  before_restart do
    FileUtils.cp "#{application['path']}/current/conf/config.inc.php-dist", "#{application['path']}/current/conf/config.inc.php"
  end
  action :force_deploy
end

nginx_app application['application_name'] do
  appliction_name         application['application_name']
  doc_root                File.join application['path'], 'current'
  server_name             Opscode::ThApplications::Helpers.server_name(node,  application)
  template                'fastcgi_load_ballancer.conf.erb'
  application_sockets     application['socket']
  fastcgi_params     application['fastcgi_params']
end

php_fpm_pool application['application_name'] do
  listen Array(application['socket']).first
end
