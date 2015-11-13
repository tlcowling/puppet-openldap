class openldap::service {
    service { 'slapd':
        ensure => stopped,
    }
}
