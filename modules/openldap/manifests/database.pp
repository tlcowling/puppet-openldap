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

   each($data) |$k, $v| {
     file_line { "database ldif ${k}":
       path  => '/etc/openldap/slapd.d/cn=config/olcDatabase={2}bdb.ldif',
       line  => "${k}: ${v}",
       match => "^${k}",
       require => File['olcDatabase{2}bdb.ldif'],
     }
   }
}
