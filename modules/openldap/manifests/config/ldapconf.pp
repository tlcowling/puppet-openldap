class openldap::config::ldapconf (
    $data
) {
    notice($data)

    include openldap::config::structure

    concat { 'openldap configuration':
        ensure => present,
        path   => '/etc/openldap/ldap.conf',
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
        require => File['basedir'],
    }

    concat::fragment { 'ldapconf comment':
        target  => 'openldap configuration', 
        source  => 'puppet:///modules/openldap/comments',
        order   => '01',
    }

    $data.each |$k, $v| {
        file_line { "openldap configuration ${k}":
          ensure => 'present',
          path   => '/etc/openldap/ldap.conf',
          line   => "${k} ${v}",
          match  => "^${k}",
          require => File['openldap configuration'],
        }         
     }
}
