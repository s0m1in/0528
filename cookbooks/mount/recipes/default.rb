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
  user(id) do
  end
    directory "/mnt/#{id}" do
      action :create
      recursive true
      not_if { File.directory?("/mnt/#{id}") }
    end
  s3fskey = mo['buckets'] + ":" + mo['access_key_id'] + ":" + mo['secret_access_key']
  file "/etc/passwd-s3fs" do
    mode 0600
    content "#{s3fskey}"
  end
  bash 'mount buckets' do
    mount_condition = "-o allow_other -o default_acl=public-read -o use_cache=/tmp"
    bucket_name = mo['buckets']
    code <<-EOF
    s3fs "#{bucket_name}" "/mnt/#{id}" #{mount_condition}
    EOF
  end
end
