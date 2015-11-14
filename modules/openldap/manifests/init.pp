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
      include openldap::config::structure
      include openldap::user
      include openldap::config::ldapconf
      include openldap::database
  } else {
      notice('OS Not supported')
  }
}
