# == Class: openldap::config::ldapconfig
#
#  Represents an openldap config
#
# === Parameters
#  [*data*]
#    Hash structure containing the KEY and the VALUE
#    Example: BASE   dc=base,dc=com
#  [*showcomment*]
#    Show the comment at the top of the ldap config
#    Default: true
#
# === Copyright Tom Cowling 2015
# === Author Tom Cowling
class openldap::config::ldapconf (
    $showcomment = true,
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

    if $showcomment {
        concat::fragment { 'ldapconf comment':
            target  => 'openldap configuration', 
            source  => 'puppet:///modules/openldap/comments',
            order   => '01',
        }
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
