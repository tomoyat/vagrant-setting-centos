#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag("users")

data_ids.each do |id|
  u = data_bag_item("users", id)
  next if u["rbenv"] != "yes"
  next if File.exist?("#{u['home']}/.rbenv")

  git "#{u['home']}/.rbenv" do
    repository "https://github.com/sstephenson/rbenv.git"
    reference "master"
    action :checkout
    user u["user_name"]
    group u["group_name"]
  end

  bash "setup zshrc" do
    user u["user_name"]
    group u["group_name"]
    cwd u["home"]
    environment "HOME" => u["home"]
    code <<-EOC
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc ;
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc ;
    EOC
  end

  directory "#{u['home']}/.rbenv/plugins" do
    user u["user_name"]
    group u["group_name"]
    action :create
  end
  git "#{u['home']}/.rbenv/plugins/ruby-build" do
    repository "https://github.com/sstephenson/ruby-build.git"
    reference "master"
    action :checkout
    user u["user_name"]
    group u["group_name"]
  end
end

# rbenv usage
# $ rbenv install --list
# $ rbenv install -v 2.0.0-p451
# $ rbenv rehash
# $ rbenv versions
# $ rbenv global 2.0.0-p451
# $ ruby -v
