#
# Cookbook:: chef_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd'

package 'firewalld'

package 'git'

#package 'vim'

service 'httpd' do
	action :start
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	variables(
	:os => node['platform'],
	:P_ip => node['ipaddress'],
	:P_domain => node['fqdn']
	)
end

#users = data_bag_item('sysuser','admin')
#user "#{users['id']}" do
#uid  "#{users['uid']}"
#shell "#{users['shell']}"
#comment "#{users['comment']}"
#end



directory '/ADMIN' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


include_recipe 'chef_test::tree'
