#
# Cookbook Name:: s3info
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
s3info = data_bag_item('s3info')

s3info.each do |acc|
    access_key  s3info['access_key']
    secret_key  s3info['secret_key']
	directory "/mnt/#{acc}" do
	recursive true
	action :create
	end
end

#s3fs = []
#search(:s3fs, "*:*").each do |acc|
#	s3name = s3fs["acc"]
#	s3fs << s3name
#	access_key  s3fs['access_key']
#	secret_key  s3fs['secret_key']
#end
