#
# Cookbook Name:: hrforecast
# Recipe:: default
#
# Copyright 2013, Aiming, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Create user
user "hrforecast" do
  supports :manage_home => true
  action   :create
end

include_recipe "hrforecast::#{node['platform_family']}"
