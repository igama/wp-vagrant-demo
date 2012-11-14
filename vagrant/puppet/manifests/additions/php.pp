class php {

  $packages = ["php5", "php5-cli", "php5-mysql", "php-pear", "php5-dev", "php5-mcrypt", "php5-gd", "php5-sqlite", "php5-intl", "php5-curl", "php5-xdebug", "libapache2-mod-php5"]
  
  package { $packages:
      ensure => present
  }

  file { "php.ini":
          path => "/etc/php5/cli/php.ini",
          source => "${config_path}/configs/etc/php5/cli/php.ini",
          require => [
                      Package["php5"],
                      Package["libapache2-mod-php5"]
                      ]
  }

  file { "apache2_php.ini":
          path => "/etc/php5/apache2/php.ini",
          source => "${config_path}/configs/etc/php5/cli/php.ini",
          require => [
                      Package["php5"],
                      Package["libapache2-mod-php5"]
                      ]
  }

}