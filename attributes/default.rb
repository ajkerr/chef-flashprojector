#
# Cookbook Name:: flashprojector
# Attributes:: default
#
# Copyright 2014, Andrew Kerr
#

default[:flashprojector][:tarfile] = 'http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa_debug.i386.tar.gz'
default[:flashprojector][:ci_user] = 'ci'
default[:flashprojector][:ci_group] = 'web'

if platform?("ubuntu") && node[:platform_version].to_f >= 14.04
	default[:flashprojector][:packages] = [
		'libc6:i386',
		'libx11-6:i386',
		'libglib2.0-0:i386',
		'libxt6:i386',
		'libgtk2.0-0:i386',
		'libnss3:i386',
		'libcurl3:i386'
	]
else
	default[:flashprojector][:packages] = [
		'libgd2-xpm:i386',
		'libgphoto2-2:i386',
		'ia32-libs-multiarch'
	]
end

