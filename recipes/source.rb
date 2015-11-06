#
# Cookbook Name:: GMAP
# Recipe:: source
#
# Copyright (c) 2015 Eagle Genomics, All Rights Reserved.

##########################################################
# package install

package ['zlib-devel', 'tar', 'make'] do
  action :install
end

##########################################################

include_recipe 'build-essential'

remote_file "#{Chef::Config[:file_cache_path]}/#{node['GMAP']['filename']}" do
  source node['GMAP']['url']
end

execute "Untar #{node['GMAP']['filename']}" do
  command "tar -xzvf #{node['GMAP']['filename']}"
  cwd Chef::Config[:file_cache_path]
  not_if { ::File.exist?("#{Chef::Config[:file_cache_path]}/#{node['GMAP']['dirname']}") }
end

bash 'Install GMAP' do
  cwd "#{Chef::Config[:file_cache_path]}/#{node['GMAP']['dirname']}"
  code <<-EOH
    ./configure --prefix="#{node['GMAP']['install_path']}"
    make
    make install
  EOH
  not_if { ::File.exist?("#{node['GMAP']['install_path']}/bin/gmap") }
end
