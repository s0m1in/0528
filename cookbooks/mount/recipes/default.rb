#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mount = data_bag('mount')
mount.each do |id|
	mo = data_bag_item('mount', id)
#	aa(id) do
#	name	['id']
#	buckets	['buckets']
#	access_key	['access_key_id']
#	secret_access_key	['secret_access_key']
#	end
  directory "/mnt/#{id}" do
    action :create
    recursive true
  end
end
