name             'th-cacti'
maintainer       'R&R Innovation LLC'
maintainer_email 'cookbooks@randrmusic.com'
license          'All rights reserved'
description      'Installs/Configures th-cacti'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends           'th-nginx'
depends           'php-fpm'
depends           'cacti'

