# Install nginx and disable default site
node.override['nginx']['default_site_enabled'] = false
#node.override['php-fpm']['pool']['www']['listen'] = node['zabbix']['web']['php']['fastcgi_listen']
include_recipe "nginx"
# Install php-fpm to execute PHP code from nginx
include_recipe "php-fpm"
applicaton_name = node['cacti']['web']['application_name'] || 'cacti'
case node['platform_family']
  when "debian"
    %w{ php5-mysql php5-gd }.each do |pck|
      package pck do
        action :install
        notifies :restart, "service[nginx]"
      end
    end
  when "rhel"
    if node['platform_version'].to_f < 6.0
      %w{ php53-mysql php53-gd php53-bcmath php53-mbstring }.each do |pck|
        package pck do
          action :install
          notifies :restart, "service[nginx]"
        end
      end
    else
      %w{ php-mysql php-gd php-bcmath php-mbstring }.each do |pck|
        package pck do
          action :install
          notifies :restart, "service[nginx]"
        end
      end
    end
end

link node['cacti']['site_root']do
  to      node['cacti']['web']['doc_root']
  only_if { !Dir.exist?(node['cacti']['web']['doc_root']) && node['cacti']['web']['doc_root'] != node['cacti']['site_root'] }
end

php_fpm_pool applicaton_name do
  listen node['cacti']['web']['php']['fastcgi_listen']
end

nginx_app applicaton_name do
  doc_root              node['cacti']['web']['doc_root']
  access_log            node['cacti']['web']['access_log']
  error_log             node['cacti']['web']['error_log']
  php_settings          node['cacti']['web']['php']['settings']
  fastcgi_listen        node['cacti']['web']['php']['fastcgi_listen']
  fqdn                  node['cacti']['web']['fqdn']
  aliases               node['cacti']['web']['aliases']
  listen                node['cacti']['web']['listen']
  listen_ssl            node['cacti']['web']['listen_ssl']
  ssl_certificate       node['cacti']['web']['ssl_certificate']
  ssl_certificate_key   node['cacti']['web']['ssl_certificate_key']
end

