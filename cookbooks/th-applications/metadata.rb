name             'th-applications'
maintainer       'R&R Innovation LLC'
maintainer_email 'cookbooks@randrmusic.com'
license          'All rights reserved'
description      'Installs/Configures th-applications'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends          'th-nginx'
depends          'php-fpm'
depends          'git'
depends          'application_nginx'

