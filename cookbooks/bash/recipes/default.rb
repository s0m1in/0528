#
# Cookbook Name:: bash
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'apt-get update and install some lib' do
	code <<-EOF
	apt-get update
	apt-get -y install automake build-essential libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool
	EOF
end
bash 'fuse' do
	cwd '/tmp'
	code <<-EOF
	wget http://sourceforge.net/projects/fuse/files/fuse-2.X/2.9.3/fuse-2.9.3.tar.gz
	tar zxf fuse-2.9.3.tar.gz
	cd fuse-2.9.3
	./configure --prefix=/usr/local
	make && make install
	EOF
	not_if { File.exists?("/usr/local/bin/fusermount") }
end
bash 's3fs' do
	cwd '/tmp'
	code <<-EOF
	wget https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.78.tar.gz
	tar zxf v1.78.tar.gz
	cd s3fs-fuse-1.78
	./autogen.sh
	./configure --prefix=/usr/local
	make && make install
	EOF
	not_if { File.exists?("/usr/local/bin/s3fs") }
end
bash 'del file and folder' do
	cwd '/tmp'
	code <<-EOF
	rm -rf v1.78.tar.gz
	rm -rf fuse-2.9.3*
	rm -rf s3fs-fuse-1.78
	EOF
end
