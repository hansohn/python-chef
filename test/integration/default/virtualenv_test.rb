# # encoding: utf-8

# Inspec test for recipe python-chef::virtualenv

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'python-chef::virtualenv' do
  title 'Testing virtualenv installation'

  describe bash('python -m pip list') do
    its('stdout') { should match /virtualenv/ }
    its('exit_status') { should eq 0 }
  end

  describe file('/opt/virtualenv/python2') do
    it { should be_directory }
  end

  describe file('/opt/virtualenv/python3') do
    it { should be_directory }
  end
end
