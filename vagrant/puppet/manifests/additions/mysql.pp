class mysql {

  package { "mysql-server":
    ensure => present,
  }

  package { "mysql-client":
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlPassword status",
    command => "mysqladmin -uroot password $mysqlPassword",
    require => Service["mysql"],
  }

  exec { "allow-remote":
    command => "sed -i \"s/^bind-address/#bind-address/\" /etc/mysql/my.cnf",
    require => Service["mysql"]
  }

  exec { "create-db":
        unless => "/usr/bin/mysql -uroot -p$mysqlPassword $database",
        command => "/usr/bin/mysql -uroot -p$mysqlPassword -e \"CREATE DATABASE $database; GRANT ALL ON $database.* TO root@localhost IDENTIFIED BY '$mysqlPassword'; GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$mysqlPassword'; GRANT ALL ON *.* TO root@'%'; FLUSH PRIVILEGES;\"",
        require => Exec["set-mysql-password"]
  }

}