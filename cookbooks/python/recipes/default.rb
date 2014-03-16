#
# Cookbook Name:: python
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "python-devel" do
  action :install
end

package "python-pycurl" do
  action :install
end

cookbook_file "#{Chef::Config[:file_cache_path]}/get-pip.py" do
  source 'get-pip.py'
  mode "0644"
  not_if { ::File.exists?("/usr/bin/pip") }
end

execute "install-pip" do
  cwd Chef::Config[:file_cache_path]
  command <<-EOF
    /usr/bin/python get-pip.py
  EOF
  not_if { ::File.exists?("/usr/bin/pip") }
end

execute "install-ansible" do
  command <<-EOF
    sudo /usr/bin/pip install ansible
  EOF
  only_if { ::File.exists?("/usr/bin/pip") }
end
