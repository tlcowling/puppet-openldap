class openldap::database (
    $host = "test.bob.com"
) {
    validate_string($host)
    notice(ldapify_host($host))

    $data = {
       olcSuffix => "giblets",
       olcGiblets=> "tom",
    }

    class { 'openldap::schema::database':
       data => $data 
    }
}
