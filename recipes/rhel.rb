#
# Cookbook Name:: hrforecast::rhel
# Recipe:: default
#
# Copyright 2013, Aiming, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum"
include_recipe "yum-remi"
include_recipe "git"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "perlbrew::default"
include_recipe "perlbrew::profile"

git_clone_dir = node.default['hrforecast']['system']['install_dir']
hrforecast_install_dir = node.default['hrforecast']['system']['install_dir']

# Get htforecast 
git git_clone_dir do
  repository "https://github.com/kazeburo/HRForecast.git"
  revision   "master"
  
  user       "root"
  group      "root"

  action     :sync

  notifies   :run, "execute[Setup mysql database]"
end

# Setup mysql database
execute "Setup mysql database" do
  user   "root"
  group  "root"

  cwd    hrforecast_install_dir

  root_db_pass = node['mysql']['server_root_password']

  not_if "mysql -h localhost -u root -p#{root_db_pass} hrforecast -e ''"

  command <<-EOF
    mysqladmin -h localhost -u root -p#{root_db_pass} create hrforecast;
    mysql -h localhost -u root -p#{root_db_pass} hrforecast < schema.sql;
  EOF
end

# Create user to mysql
execute "Create hrforecast user to mysql" do
  root_db_pass = node['mysql']['server_root_password']
  db_user = node['hrforecast']['database']['user_name']
  db_pass = node['hrforecast']['database']['password']

  command <<-EOF
    mysql -u root -p#{root_db_pass} -e \
      "GRANT CREATE, ALTER, DELETE, INSERT, UPDATE, SELECT ON \
         hrforecast.* TO '#{db_user}'@'localhost' IDENTIFIED BY '#{db_pass}';"
  EOF

  not_if "mysql -u #{db_user} -p#{db_pass} hrforecast -e"
end

# Setup hrforecast configuration file
template "#{node['hrforecast']['system']['install_dir']}/config.pl" do
  source   "config.pl.erb"
  owner    "root"
  group    "root"
  mode     0644

  notifies :restart, "service[hrforecast]"
end

# Setup upstart script of hrforecast
template "/etc/init/hrforecast.conf" do
  source   "hrforecast.service.conf.erb"
  owner    "root"
  group    "root"
  mode     0644

  notifies :restart, "service[hrforecast]" 
end

# Service setting of hrforecast
service "hrforecast" do
  supports :restart => true, :reload => true, :status => true
  action   :start
  provider Chef::Provider::Service::Upstart
end
