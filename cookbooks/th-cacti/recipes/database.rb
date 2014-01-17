settings = Cacti.settings(node)

if settings['database']['host'] == 'localhost'
  execute 'ungzip_cacti_sql' do
    cwd '/usr/share/doc/cacti'
    command 'gunzip cacti.sql.gz'
    action :run
    only_if do
      node['platform'] == 'ubuntu' && File.exists?('/usr/share/doc/cacti/cacti.sql.gz')
    end
  end
  include_recipe 'cacti::database'
end
