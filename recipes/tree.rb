package 'tree'
package 'git'

directory "/home/ec2-user/Rajus" do
owner 'ec2-user'
group 'ec2-user'
mode 0755
action :create
end


user 'Niks' do 
comment 'a normal user'
uid '5023'
home '/home/Niks'
shell '/bin/bash'
password 'VlA2hGVm7uJQg'
action :create
end

file '/home/ec2-user/Rajus/Dedicatede' do
content 'This file isdedicated to nik user'
owner 'ec2-user'
group 'ec2-user'
mode 0755
action :create
end

execute "Disk_Size_details_" do
command "df -h > /home/ec2-user/DiskUSage"
end

execute "Delete Niks" do
command "userdel Niks"
end


