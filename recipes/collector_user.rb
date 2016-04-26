#
# Cookbook Name:: ubuntu_collectd
# Recipe:: collector_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group 'collector'
user 'collector' do
  group 'collector'
  home '/var/lib/scripts/collector'
  shell '/bin/sh'
end

file = Chef::Util::FileEdit.new("/etc/sudoers")
file.insert_line_if_no_match(/collector ALL=(root) NOPASSWD:\/usr\/sbin\/smartctl */, 'collector ALL=(root) NOPASSWD:/usr/sbin/smartctl *')
file.write_file
