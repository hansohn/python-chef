# # encoding: utf-8

# Inspec test for recipe python-chef::python2

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'python-chef::python2' do
  title 'Testing python2 installation'

  describe package('python-devel') do
    it { should be_installed }
  end

  describe package('python2-pip') do
    it { should be_installed }
  end

  describe package('python-setuptools') do
    it { should be_installed }
  end

  describe file('/bin/python2') do
    it { should be_file }
  end

  describe file('/bin/pip2') do
    it { should be_file }
  end

  describe file('/bin/easy_install-2.7') do
    it { should be_file }
  end

  describe bash('/bin/python2 -m pip list') do
    its('stdout') { should match /pip/ }
    its('exit_status') { should eq 0 }
  end

  describe bash('/bin/python2 -m pip list') do
    its('stdout') { should match /setuptools/ }
    its('exit_status') { should eq 0 }
  end

  describe bash('/bin/python2 -m pip list') do
    its('stdout') { should match /wheel/ }
    its('exit_status') { should eq 0 }
  end
end
