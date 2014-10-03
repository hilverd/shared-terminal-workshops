class sandbox {
  file { "/home/vagrant/exercises-sandbox":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    owner => "vagrant",
    group => "vagrant",
    mode => 0666,
    source => "puppet:///modules/sandbox/exercises-sandbox",
  }
}
