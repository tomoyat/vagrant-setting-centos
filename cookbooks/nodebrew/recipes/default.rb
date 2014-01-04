#
# Cookbook Name:: nodebrew
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag("users")

data_ids.each do |id|
  u = data_bag_item("users", id)
  next if u["nodebrew"] != "yes"
  
  bash "install nodebrew" do
    user u["user_name"]
    group u["group_name"]
    cwd u["home"]
    environment "HOME" => u["home"]
    code <<-EOC
      curl -L git.io/nodebrew | perl - setup
    EOC
    creates "#{u['home']}/.nodebrew/current/bin/nodebrew"
  end
end
