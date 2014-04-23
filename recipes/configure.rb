# encoding: utf-8
#
# Cookbook Name:: nmdvarnish
# Recipe:: default
#
# Author:: David Arnold
# Copyright:: 2014, NewMedia Denver
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

nmdvarnish_data = data_bag_item('nmdvarnish', 'configure')[node.chef_environment]
Chef::Log.debug("nmdvarnish_data = #{nmdvarnish_data.inspect}")

template node[:nmdvarnish][:varnishconf][:path] do
  source 'varnish.erb'
  mode 0644
  owner 'root'
  group 'root'
end

Chef::Log.debug("nmdvarnish_data = #{nmdvarnish_data.inspect}")

template node[:nmdvarnish][:vclfile] do
  source 'vclfile.erb'
  mode 0644
  owner 'root'
  group 'root'
  variables(vcl_config_data: nmdvarnish_data)

end
