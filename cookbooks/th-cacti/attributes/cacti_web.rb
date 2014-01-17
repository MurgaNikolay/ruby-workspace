default['cacti']['web']['application_name']  = 'cacti.vocvox.com'
default['cacti']['web']['install_method']  = 'nginx'
default['cacti']['web']['fqdn'] = 'cacti.vocvox.com'
default['cacti']['web']['aliases'] = [ 'cacti2.vocvox.com' ]
default['cacti']['web']['listen'] = 80
default['cacti']['web']['access_log'] = nil
default['cacti']['web']['error_log'] = nil
default['cacti']['web']['doc_root'] = '/usr/share/cacti/site'

default['cacti']['web']['php']['fastcgi_listen'] = '127.0.0.1:9000' #only applicable when using php-fpm (nginx)
default['cacti']['web']['php']['settings'] = {
    'memory_limit' => '256M',
    'post_max_size' => '32M',
    'upload_max_filesize' => '16M',
    'max_execution_time' => '600',
    'max_input_time' => '600',
    'date.timezone' => "'UTC'",
}
