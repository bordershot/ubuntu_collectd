#
# Cookbook Name:: ubuntu_collectd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'
#include_recipe 'collectd::default'
include_recipe 'collectd_plugins::default'
include_recipe 'collectd_plugins::write_graphite'
include_recipe 'ubuntu_collectd::cpufreq'
include_recipe 'collectd_plugins::disk'
include_recipe 'collectd_plugins::network'
include_recipe 'ubuntu_collectd::nfs'
include_recipe 'ubuntu_collectd::ping'
include_recipe 'collectd_plugins::processes'
include_recipe 'collectd_plugins::rrdtool'
include_recipe 'collectd_plugins::swap'
include_recipe 'ubuntu_collectd::users'
include_recipe 'ubuntu_collectd::memcached'
include_recipe 'ubuntu_collectd::irq'
include_recipe 'ubuntu_collectd::entropy'
include_recipe 'ubuntu_collectd::battery'
include_recipe 'ubuntu_collectd::apcups'
include_recipe 'ubuntu_collectd::hddtemp'
include_recipe 'ubuntu_collectd::smartmon'
include_recipe 'ubuntu_collectd::collector_user'
include_recipe 'ubuntu_collectd::squid'

package 'smartmontools'
package 'apcupsd'
package 'hddtemp'
package 'squidclient'

directory '/var/lib/scripts/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/lib/scripts/collectd/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/var/lib/scripts/collectd/collectd-smartmon.sh' do
  source 'collectd-smartmon.sh'
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file '/var/lib/scripts/collectd/squid' do
  source 'squid'
  owner 'root'
  group 'root'
  mode '0755'
end


if Dir.exist?('/sonic/data/collectd') 
  directory '/var/lib/collectd' do
    recursive true
    action :delete
  end
  link '/var/lib/collectd' do
    to '/sonic/data/collectd'
  end
#else
#  directory '/var/lib/collectd' do
#    owner 'collectd'
#    group 'collectd'
#    mode '0755'
#    action :create
#  end
#  directory '/var/lib/collectd/rrd' do
#    owner 'collectd'
#    group 'collectd'
#    mode '0755'
#    action :create
#  end
end

cookbook_file '/etc/apcupsd/apcupsd.conf' do
  source 'apcupsd.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/default/apcupsd' do
  source 'apcupsd'
  owner 'root'
  group 'root'
  mode '0644'
end


cookbook_file '/etc/default/hddtemp' do
  source 'hddtemp'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'apcupsd' do
  action [ :enable, :start ]
end

service 'hddtemp' do
  action [ :enable, :start ]
end
#directory '/sonic' do
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#directory '/sonic/data' do
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#directory '/sonic/data/collectd' do
#  owner 'collectd'
#  group 'collectd'
#  mode '0755'
#  action :create
#end

#directory '/sonic/data/collectd/rrd' do
#  owner 'collectd'
#  group 'collectd'
#  mode '0755'
#  action :create
#end

#link '/var/lib/collectd' do
#  to '/sonic/data/collectd'
#end
