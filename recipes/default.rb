#
# Cookbook Name:: hrforecast
# Recipe:: default
#
# Copyright 2013, Aiming, Inc.
#
# All rights reserved - Do Not Redistribute
#

user_name = node.default['hrforecast']['system']['user_name']

# Create hrforecast application user
user user_name do
  supports :manage_home => true
  action   :create
end

include_recipe "hrforecast::#{node['platform_family']}"
