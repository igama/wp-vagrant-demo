class cleanup {
      
      #reload apache2 in the end
      exec { "reload-apache2":
         command => "/etc/init.d/apache2 reload",
         refreshonly => true,
      }

      #reload mysql in the end
      exec { "reload-mysql":
         command => "/etc/init.d/mysql restart",
         refreshonly => true,
      }


   check_mode { "/vagrant/logs":
    mode => 777,
  }
  
}
