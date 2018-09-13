#
# Cookbook:: cps_cap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'cps_cap::terraform'
include_recipe 'cps_cap::vscode'
include_recipe 'cps_cap::chefdk'

reboot 'Initial reboot' do
  action :nothing
end

ruby_block 'Toggle reboot switch' do
  block do
    node.normal['cps_cap']['initial_reboot'] = false
  end
  only_if { node['cps_cap']['initial_reboot'] }
  notifies :request_reboot, 'reboot[Initial reboot]', :immediate
  action :run
end
