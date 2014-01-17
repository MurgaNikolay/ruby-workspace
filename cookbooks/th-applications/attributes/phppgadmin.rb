default['application']['phppgadmin']['application_name'] = 'pga'
default['application']['phppgadmin']['fqdn'] = 'pga2.vocvox.com'
default['application']['phppgadmin']['aliases'] = []
default['application']['phppgadmin']['path'] = '/var/www/phppgadmin'
default['application']['phppgadmin']['socket'] = "#{default['application']['phppgadmin']['path']}/shared/sockets/fpm.socket"
default['application']['phppgadmin']['user'] = 'deploy'
default['application']['phppgadmin']['group'] = 'deploy'

default['application']['phppgadmin']['fastcgi_params']['PHP_VALUE'] =  "\"memory_limit=256M\npost_max_size=32M\nupload_max_filesize=16M\nmax_execution_time=600\nmax_input_time=600\ndate.timezone='UTC'\""
default['application']['phppgadmin']['repository'] = 'https://github.com/phppgadmin/phppgadmin.git'
default['application']['phppgadmin']['revision'] = 'REL_5-1-0'




default['application']['phppgadmin']['packages'] = [

]