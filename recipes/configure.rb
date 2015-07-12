#
# Cookbook Name:: opsworks-resque-scheduler
# Recipe:: default
#
# Copyright (C) 2014 PEDRO AXELRUD
#
# All rights reserved - Do Not Redistribute
#

node[:deploy].each do |application, deploy|

  template "/etc/init/resque-scheduler-#{application}.conf" do

    source "resque-scheduler.conf.erb"
    variables({
                  :rails_env => deploy[:rails_env],
                  :app_dir => "#{deploy[:deploy_to]}/current"
              })
    mode "0755"
  end

end
