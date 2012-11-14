import 'additions/*.pp'

#Don't Change
  $dev_path = "/vagrant/vagrant"
  $config_path = "/vagrant/vagrant/puppet"


#MYSQL Definitions
  $mysqlPassword = "root"
  $database = "development"

#### Initialization ####

stage { 'first': before => Stage['main'] }
stage { 'last': require => Stage['main'] }

group { "puppet": ensure => "present"}

Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin" } 

#### Default Execution #####

class doInstall {
  class { 'base-setup': stage => "first" }
  include apache2
  include php
  include mysql
  include phpmyadmin
  class { 'cleanup': stage => "last" }
}

include doInstall

#### Functions ####

define check_mode($mode) {
  exec { "/bin/chmod -R $mode $name":
    unless => "/bin/sh -c '[ $(/usr/bin/stat -c %a $name) == $mode ]'",
  }
}