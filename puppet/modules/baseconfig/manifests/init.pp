class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  file {
    '/home/vagrant/presenter-session.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0755',
      source => 'puppet:///modules/baseconfig/presenter-session.sh';
  }

  file {
    '/home/vagrant/monitor-connected-users.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0755',
      source => 'puppet:///modules/baseconfig/monitor-connected-users.sh';
  }

 file {
    '/home/vagrant/remove-all-docker-containers.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0755',
      source => 'puppet:///modules/baseconfig/remove-all-docker-containers.sh';
  }

  file {
    '/home/vagrant/tmux-session-for-user.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0777',
      source => 'puppet:///modules/baseconfig/tmux-session-for-user.sh';
  }

  file {
    '/home/vagrant/docker-exercises-sandbox.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0777',
      source => 'puppet:///modules/baseconfig/docker-exercises-sandbox.sh';
  }

  file { "/var/tmux":
    ensure => directory,
    mode => 0777;
  }
}
