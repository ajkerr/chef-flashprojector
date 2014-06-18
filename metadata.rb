name             "chef-flashprojector"
maintainer       "Andrew Kerr"
maintainer_email "andrew@ajk-solutions.com"
description      "Cookbook for installing the Linux Flash Player 11.2 Projector"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
license          "MIT"
version          "0.1.1"

%w{ }.each do |cb|
  depends cb
end

%w{ ubuntu }.each do |os|
  supports os
end

recipe "flashprojector::default", "Installs the Linux Flash Player 11.2 Projector"
