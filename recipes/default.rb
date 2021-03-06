#
# Cookbook Name:: flashprojector
# Recipe:: default
#
# Copyright 2014, Andrew Kerr
#
#

# Adobe never released a 64-bit standalone projector, so we need to install
# support for 32-bit executables.
bash 'Enable 32-bit executables' do
  code <<-EOH
  dpkg --add-architecture i386
  apt-get update
  EOH
  only_if { platform?("ubuntu") && node[:platform_version].to_f >= 14.04 }
end

node[:flashprojector][:packages].each do |pkg|
  package pkg do
    action :install
  end
end

# FlexUnit runs the projector in a VNC server.
package "vnc4server"

# VNC won't run without a password file being set up in your CI user's home directory.
directory "/home/#{node[:flashprojector][:ci_user]}/.vnc" do
  recursive true
  owner node[:flashprojector][:ci_user]
  group node[:flashprojector][:ci_group]
  mode "0755"
end

cookbook_file "/home/#{node[:flashprojector][:ci_user]}/.vnc/passwd" do
  source "vnc_passwd"
  owner node[:flashprojector][:ci_user]
  group node[:flashprojector][:ci_group]
  mode "0600"
end

cookbook_file "/home/#{node[:flashprojector][:ci_user]}/mm.cfg" do
  source "mm.cfg"
  owner node[:flashprojector][:ci_user]
  group node[:flashprojector][:ci_group]
  mode "0644"
end

# Download the Flash Projector
remote_file "#{Chef::Config[:file_cache_path]}/flashprojector.tar.gz" do
  source node[:flashprojector][:tarfile]
end

bash 'Extract Flash Projector' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  tar xzf flashprojector.tar.gz
  mv flashplayerdebugger /usr/bin/
  EOH
end

# Put the projector where FlexUnit's Ant Task expects it to be.
link "/usr/bin/gflashplayer" do
  to "/usr/bin/flashplayerdebugger"
end
