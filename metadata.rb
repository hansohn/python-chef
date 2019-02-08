name 'python-chef'
maintainer 'Ryan Hansohn'
maintainer_email 'info@imnorobot.com'
license 'MIT'
description 'Installs/Configures python-chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 13.0' if respond_to?(:chef_version)
source_url 'https://github.com/hansohn/python-chef' if respond_to?(:source_url)
issues_url 'https://github.com/hansohn/python-chef/issues' if respond_to?(:issues_url)

supports 'centos', '>= 7.0'
