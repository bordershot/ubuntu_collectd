default['collectd-plugins']['write_graphite'] = { :node => { :id => 'tardis', :host => '127.0.0.1', :port => '2003', :protocol => 'udp', :prefix => 'collectd.', :postfix => '', :escape_character => '_', :separate_instances => 'false', :store_rates => 'false', :always_append_d_s => 'false' }}

default['collectd-plugins']['network']['listen'] = '0.0.0.0" "25826'
default['collectd-plugins']['ping'] = { :host => 'yahoo.com', :interval => 5.0, :timeout => 2.9, :max_missed => 3 }
default['collectd-plugins']['rrdtool']['data_dir'] = '/var/lib/collectd/rrd'

default['collectd-plugins']['memcached'] = { :instance => { :host => '127.0.0.1', :port => '11211' }}
default['collectd-plugins']['apcups'] = { :host => 'localhost', :port => '3551', :report_seconds => 'true'}
default['collectd-plugins']['hddtemp'] = { :host => 'localhost', :port => '7634' }
default['collectd-plugins']['smartmon']['exec'] = 'collector:collector" "/var/lib/scripts/collectd/collectd-smartmon.sh" "sda" "sdb" "sdc" "sdd" "sde" "sdf" "sdh'
default['collectd-plugins']['squid']['exec'] = 'collector:collector" "/var/lib/scripts/collectd/squid'
