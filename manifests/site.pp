require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git'],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  # include dnsmasq
  include git
  # include hub
  # include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  # include nodejs::v0_4
  # include nodejs::v0_6
  # include nodejs::v0_8
  # include nodejs::v0_10

  # default ruby versions
  # include ruby::1_8_7
  # include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  # make/support rbenv implicits gemsets
  # http://devoh.com/blog/2012/07/implicit-gemsets-with-rbenv
  exec { 'bundle config --global':
    command => 'bundle config --global bin bin \
                && bundle config --global path .bundle',
    creates => "/Users/${::luser}/.bundle/config",
    path    => '/usr/bin',
  }

  # make/support rbenv implicits gemsets
  # Installing rbenv plugin
  ruby::plugin { 'rbenv-vars':
    ensure  => 'v1.2.0',
    source  => 'sstephenson/rbenv-vars',
    require => File['/opt/boxen/rbenv/vars']
  }

  # make/support rbenv implicits gemsets
  # set rbenv-vars to use local gems
  file { '/opt/boxen/rbenv/vars':
    content => 'GEM_PATH=.bundle'
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

}
