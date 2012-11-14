class base-setup {
  
  Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin' }
  
  $basePackages = ["curl","htop","dnsutils","lsof","rsync"]
  
  package { "build-essential":
            ensure => present
          }

  package { $basePackages:
            ensure => present,
            require => Package["build-essential"]
          }
  
  $vcsPackages = ["git","git-core","subversion","mercurial"]
  
  package { $vcsPackages: ensure => present }


}