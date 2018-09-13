#
# Cookbook:: cps_cap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'cps_cap::terraform'
include_recipe 'cps_cap::vscode'
include_recipe 'cps_cap::chefdk'
