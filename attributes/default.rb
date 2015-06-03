default['GMAP']['version'] = '2013-11-27'
default['GMAP']['dirname'] = "gmap-#{node['GMAP']['version']}"
default['GMAP']['filename'] = "gmap-gsnap-#{node['GMAP']['version']}.tar.gz" 
default['GMAP']['url'] = "http://research-pub.gene.com/gmap/src/#{node['GMAP']['filename']}" 
default['GMAP']['install_path'] = '/usr/local'
