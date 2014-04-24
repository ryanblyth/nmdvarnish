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

if platform?('redhat', 'centos', 'fedora')
  os_major_ver = node[:platform_version].split('.')
  execute 'add-varnish3-rpm' do
    if os_major_ver == '5'
      command '/bin/rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release/varnish-release-3.0-1.el5.centos.noarch.rpm'
    elsif os_major_ver == '6'
      command 'rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el6/noarch/varnish-release/varnish-release-3.0-1.el6.noarch.rpm'

    end

  end
end

%w(varnish).each do |pkg|
  package pkg do
    action :install
  end
end
