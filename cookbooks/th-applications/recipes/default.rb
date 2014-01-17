#
# Cookbook Name:: th-applications
# Recipe:: default
#
# Copyright (C) 2014 R&R Innovation LLC
# 
# All rights reserved - Do Not Redistribute
#

package 'mc'
include_recipe 'git'

case node['platform_family']
  when "debian"
    %w{ php5-mysql php5-gd php5-pgsql}.each do |pck|
      package pck do
        action :install
        notifies :restart, "service[nginx]"
      end
    end
  when "rhel"
    if node['platform_version'].to_f < 6.0
      %w{ php53-mysql php53-gd php53-pgsql php53-bcmath php53-mbstring }.each do |pck|
        package pck do
          action :install
          notifies :restart, "service[nginx]"
        end
      end
    else
      %w{ php-pgsql php-mysql php-gd php-bcmath php-mbstring }.each do |pck|
        package pck do
          action :install
          notifies :restart, "service[nginx]"
        end
      end
    end
end
include_recipe 'th-nginx'