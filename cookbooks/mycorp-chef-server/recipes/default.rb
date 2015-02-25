#
# Cookbook Name:: mycorp-chef-server
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

certificate_manage "wildcard" do
	nginx_cert true
end

node.override["chef-server"]["configuration"]["nginx"]["ssl_certificate"] = "/etc/pki/tls/certs/#{node['fqdn']}.pem"
node.override["chef-server"]["configuration"]["nginx"]["ssl_certificate_key"] = "/etc/pki/tls/private/#{node['fqdn']}.key"

template "/template_test" do
	source "dummy_template.erb"
	mode 0644
	action :create_if_missing
	variables lazy {
		{
			fqdn: node['fqdn']
		}
	}
end
