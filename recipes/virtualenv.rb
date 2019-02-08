# Cookbook Name:: jupyterhub-chef
# Recipe:: virtualenv
#
# The MIT License (MIT)
#
# Copyright:: 2019, Ryan Hansohn
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# install virtualenv
bash 'python_pip_install_virtualenv' do
  code 'python -m pip install --upgrade virtualenv'
end unless node['python']['virtualenvs'].empty?

# create virtualenv(s)
node['python']['virtualenvs'].each do |name, params|
  directory "virtualenv_#{name}_#{params['dest_dir']}" do
    path params['dest_dir']
    recursive true
    action :create
  end

  bash "virtualenv_create_#{name}" do
    code <<-EOH
        if [ ! -d #{params['dest_dir']}/#{name}/bin ]; then
          virtualenv -p #{params['python']} #{params['dest_dir']}/#{name}
        fi
        source #{params['dest_dir']}/#{name}/bin/activate
        python -m pip install #{params['pips'].join(' ')}
        deactivate
      EOH
    only_if { File.exist?(params['python']) }
  end
end
