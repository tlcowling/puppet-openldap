# == Class: openldap::database
#
class openldap::database (
   $data = {}
) {
   file { 'olcDatabase{2}bdb.ldif':
       ensure => 'present',
       mode   => '0600',
       owner  => 'ldap',
       group  => 'ldap',
       path   => '/etc/openldap/slapd.d/cn=config/olcDatabase={2}bdb.ldif',
   } 

   file_line { 'database ldif 1':
       path  => '/etc/openldap/slapd.d/cn=config/olcDatabase={2}bdb.ldif',
       line  => 'olcThomasGiblets: NICE',
       match => '^olcThomasGiblets:',
   }
}
