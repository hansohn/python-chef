# # encoding: utf-8

# Inspec test for recipe python-chef::python3

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'python-chef::python3' do
  title 'Testing python3 installation'

  describe package('python36u-devel') do
    it { should be_installed }
  end

  describe package('python36u-pip') do
    it { should be_installed }
  end

  describe package('python36u-setuptools') do
    it { should be_installed }
  end

  describe file('/bin/python3.6') do
    it { should be_file }
  end

  describe file('/bin/pip3.6') do
    it { should be_file }
  end

  describe file('/bin/easy_install-3.6') do
    it { should be_file }
  end

  describe file('/bin/python3') do
    it { should be_symlink }
  end

  describe file('/usr/bin/python3') do
    it { should be_symlink }
  end

  describe bash('/bin/python3 -m pip list') do
    its('stdout') { should match /pip/ }
    its('exit_status') { should eq 0 }
  end

  describe bash('/bin/python3 -m pip list') do
    its('stdout') { should match /setuptools/ }
    its('exit_status') { should eq 0 }
  end

  describe bash('/bin/python3 -m pip list') do
    its('stdout') { should match /wheel/ }
    its('exit_status') { should eq 0 }
  end
end
