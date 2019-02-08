default['python'] = {
  'python2' => {
    'packages' => [
      'python-devel',
      'python2-pip',
      'python-setuptools',
    ],
    'bin' => '/bin/python2',
    'pip_bin' => '/bin/pip2',
    'easy_install_bin' => '/bin/easy_install-2.7',
    'pips' => [],
    'easy_installs' => [],
    'symlinks' => {},
  },
  'python3' => {
    'packages' => [
      'python36u-devel',
      'python36u-pip',
      'python36u-setuptools',
    ],
    'bin' => '/bin/python3.6',
    'pip_bin' => '/bin/pip3.6',
    'easy_install_bin' => '/bin/easy_install-3.6',
    'pips' => [],
    'easy_installs' => [],
    'symlinks' => {
      '/bin/python3' => 'python3.6',
      '/usr/bin/python3' => 'python3.6',
    },
  },
  'virtualenvs' => {},
}
