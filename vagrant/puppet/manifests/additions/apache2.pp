class apache2 {
    
  include apache-confs
  include apache-enable-mods

  package { "apache2":
    name => "apache2",
    ensure => installed,
  }

  service { "apache2":
    enable => true,
    ensure => running,
    require => Package['apache2'],
    subscribe => [Class [apache-confs], Class[apache-enable-mods]]
  }

  check_mode { "/var/log/apache2":
    mode => 777,
  }


}

class apache-confs {

  exec { "change-owner":
    command => "sed -i \"s/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/\" /etc/apache2/envvars"
  }

  exec { "change-group":
    command => "sed -i \"s/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/\" /etc/apache2/envvars"
  }

  file { "000-default":
      path => "/etc/apache2/sites-available/default",
      source => "${config_path}/configs/etc/apache2/sites-available/default",
  }

}

class apache-enable-mods {
  exec { "enable_rewrite":
          command => "/usr/sbin/a2enmod rewrite",
          require => Package['apache2'],
          unless => "/usr/bin/test -s /etc/apache2/mods-enabled/rewrite.load",
  }

    exec { "enable_headers":
          command => "/usr/sbin/a2enmod headers",
          require => Package['apache2'],
          unless => "/usr/bin/test -s /etc/apache2/mods-enabled/headers.load"
  }             

  exec { "enable_expires":
          command => "/usr/sbin/a2enmod expires",
          require => Package['apache2'],
          unless => "/usr/bin/test -s /etc/apache2/mods-enabled/expires.load"
  }
 
}