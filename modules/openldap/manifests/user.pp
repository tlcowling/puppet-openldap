class openldap::user {
    user { 'ldap':
        uid     => '55',
        gid     => '55',
        ensure  => 'present',
        shell   => '/sbin/nologin',
        groups  => 'ldap',
        require => Group['ldap'],
    }
    group { 'ldap':
        gid     => '55',
        ensure  => 'present',
    }
}
