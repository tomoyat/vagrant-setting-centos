#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "git" do
  action :install
end

package "zsh" do
  action :install
end

package "screen" do
  action :install
end

package "vim" do
  action :install
end
