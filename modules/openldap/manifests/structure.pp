# == Class: openldap::structure
#
#  Sets out the directory structure for openldap and ensures permissions
#  remain consistent
class openldap::structure {
    file { 'basedir':
        path    => '/etc/openldap',
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/etc/openldap/slapd.d':
        ensure  => 'directory',
        mode    => '0700',
        owner   => 'ldap',
        group   => 'ldap',
        require => File['basedir'],
    }

    file { '/etc/openldap/certs':
        ensure  => 'directory',
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
        require => File['basedir'],
    }

    file { '/etc/openldap/schema':
        ensure  => 'directory',
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
        require => File['basedir'],
    }
}
