#
# Cookbook Name:: ubuntu_collectd
# Recipe:: battery
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#
# Cookbook: collectd_plugins --Modified from cpu.rb
# License: Apache 2.0
#
# Copyright 2010, Atari, Inc
# Copyright 2015, Bloomberg Finance L.P.
#
include_recipe 'collectd::default'

collectd_plugin 'battery' do
  user node['collectd']['service_user']
  group node['collectd']['service_group']
  directory node['collectd']['service']['config_directory']
  options node['collectd-plugins']['battery']
  notifies :restart, "collectd_service[#{node['collectd']['service_name']}]", :delayed
end

