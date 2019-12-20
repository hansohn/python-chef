default['python'] = {
  'python2' => {
    'packages' => %w(
      python-devel
      python2-pip
      python-setuptools
    ),
    'bin' => '/bin/python2',
    'pip_bin' => '/bin/pip2',
    'easy_install_bin' => '/bin/easy_install-2.7',
    'pips' => %w(),
    'easy_installs' => %w(),
    'symlinks' => {},
  },
  'python3' => {
    'packages' => %w(
      python3-devel
      python3-pip
      python3-setuptools
    ),
    'bin' => '/bin/python3.6',
    'pip_bin' => '/bin/pip3.6',
    'easy_install_bin' => '/bin/easy_install-3.6',
    'pips' => %w(),
    'easy_installs' => %w(),
    'symlinks' => {},
  },
  'virtualenvs' => {},
}
