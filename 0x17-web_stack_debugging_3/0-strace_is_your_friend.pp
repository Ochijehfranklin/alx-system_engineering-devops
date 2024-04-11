# To fix "phpp" extension yo "php" i "wp-strings.php"

exec{'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}


