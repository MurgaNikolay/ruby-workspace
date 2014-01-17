define :nginx_app, :enable => true do

  application_name = params[:application_name] = params[:name]

  include_recipe 'nginx::default'

  params[:doc_root] ||= node['nginx']['app']['doc_base_root'] << '/' << application_name
  template "#{node['nginx']['dir']}/sites-available/#{application_name}.conf" do
    source   params[:template] || 'web_nginx.erb'
    owner    node['nginx']['user']
    group    node['nginx']['group']
    mode     '0644'
    cookbook params[:cookbook] if params[:cookbook]
    variables(params)
    if ::File.exists?("#{node['nginx']['dir']}/sites-enabled/#{application_name}.conf")
      notifies :reload, 'service[nginx]'
    end
  end

  site_enabled = params[:enable]
  nginx_site "#{params[:name]}.conf" do
    enable site_enabled
  end
end