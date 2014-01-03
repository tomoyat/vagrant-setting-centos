#
# Cookbook Name:: user-setting
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag("users")

data_ids.each do |id|
  u = data_bag_item("users", id)
  user u["user_name"] do
    uid u["uid"]
    home u["home"]
    password u["password"]
    shell u["shell"]
    action [:create]
  end
  group u["group_name"] do
    gid u["gid"]
    members u["user_name"]
    action [:create]
  end
  directory u["home"] do
    owner u["user_name"]
    group u["group_name"]
    mode 00755
    action :create
  end
end
