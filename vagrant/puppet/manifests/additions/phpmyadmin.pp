class phpmyadmin
{
    package
    {
        "phpmyadmin":
            ensure => present,
            require => [
                Package["php5", "php5-mysql", "apache2"],
            ]
    }
  
    file
    {
        "/etc/apache2/conf.d/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => [
                        Package['phpmyadmin'],
                        Package['apache2']
                        ],
            notify => Service["apache2"]
    }
}