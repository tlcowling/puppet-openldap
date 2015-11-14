class openldap {
  if $osfamily == 'RedHat' {

      $packages = [
          "openldap", 
          "openldap-servers", 
          "openldap-clients", 
          "openldap-devel"
      ]
      
      package { $packages:
        allow_virtual => 'false',
        ensure        => 'installed',
      }

      include openldap::service
      include openldap::structure
      include openldap::user
      include openldap::config::client
      include openldap::database

  } else {
      notice('OS Not supported')
  }
}
