# Modify the configuration file ssh_config

file { '/etc/ssh/ssh_config':
  ensure => present,
}

file_line { 'Use private key in ~/.ssh/school':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile /root/.ssh/school',
  match  => '^#IdentityFile',
  insert => 'before',
}

file_line { 'Disable password Authentication':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
    match   => '^#?PasswordAuthentication',
  insert  => 'before',   
}
