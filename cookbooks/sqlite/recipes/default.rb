#
# Cookbook Name:: sqlite
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "sqlite" do
  action :install
end

package "sqlite-devel" do
  action :install
end
