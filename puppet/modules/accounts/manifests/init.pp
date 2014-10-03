class accounts {
  include docker
  require docker

  # Note that you also need to change the users in ssh::server below
  $tmux_users = ['alice', 'bob']

  define create_user {
    $user = $name
    
    user { $user:
      ensure => present,
      # At the moment the password for each user is "vagrant". Obtain a different password by
      # running mkpasswd -m sha-512 <password> and pasting the output below.
      password => '$6$qQRxhiaIGy$8KHW4c7KEB3iOLZJRK/LVxybes7Ds3WYg6ymBe6fHh.8VUTnFOQfxUr/zYTQjvlgdL2Go5wNZRjXLn2y5VE7x0',
      groups => ['docker'],
      home => '/tmp',
      shell => "/bin/bash",
    }
  }

  create_user { $tmux_users:; }
  
  # TODO: Find a way to get the users defined by $tmux_users above instead of hardcoding below
  class { 'ssh::server':
    storeconfigs_enabled => false,
    options => {
      'Match User alice' => { 'ForceCommand' => '/home/vagrant/tmux-session-for-user.sh' },
      'Match User bob' => { 'ForceCommand' => '/home/vagrant/tmux-session-for-user.sh' },

      'PasswordAuthentication'          => 'yes',
      'PermitRootLogin'                 => 'without-password',
      'Port'                            => [22],
      'PubkeyAuthentication'            => 'yes',
    }
  }
}
