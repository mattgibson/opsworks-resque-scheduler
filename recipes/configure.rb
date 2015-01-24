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

    escaped_env_vars = OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables])
    env_string = escaped_env_vars.collect { |key, value| %Q{#{key}="#{value}"} }.join(' ')

    source "resque-scheduler.conf.erb"
    variables({
                  :env_vars => env_string
              })
    mode "0755"
  end

end
