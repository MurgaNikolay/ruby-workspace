default['application']['phpmyadmin']['application_name'] = 'pma'
default['application']['phpmyadmin']['fqdn'] = 'pma2.vocvox.com'
default['application']['phpmyadmin']['aliases'] = []
default['application']['phpmyadmin']['socket'] = '/var/www/phpmyadmin/shared/sockets/fpm.socket'
default['application']['phpmyadmin']['user'] = 'deploy'
default['application']['phpmyadmin']['group'] = 'deploy'

default['application']['phpmyadmin']['path'] = '/var/www/phpmyadmin'
default['application']['phpmyadmin']['repository'] = 'https://github.com/phpmyadmin/phpmyadmin.git'
default['application']['phpmyadmin']['revision'] = 'RELEASE_4_1_4'
