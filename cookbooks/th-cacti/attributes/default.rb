default['cacti']['group']  = 'www-data'
default['cacti']['user']  = 'cacti'
default['cacti']['site_root']  = value_for_platform(
    %w{ centos fedora redhat } => {
        'default' => '/usr/share/cacti'
    },
    %w{ ubuntu } => {
        'default' => '/usr/share/cacti/site'
    }
)

default['cacti']['admin']['password'] = 'p45gh548GL4h'
default['cacti']['database']['password'] = 'xZUx4cVHMD'


