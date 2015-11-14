module Puppet::Parser::Functions
    newfunction(:ldapify_host, :type => :rvalue, :doc => <<-EOS
Returns the ldap form of a hostname. For instance if called 
with 'sample.example.com' will return 'dc=sample,dc=example,dc=com'.
    EOS
) do |arguments|
        raise(Puppet::ParseError, "ldapify_host(): Wrong number of arguments given (#{arguments.size} instead of 1)") if arguments.size != 1
        host = arguments[0] 
        host.split('.').map {|e| "dc="+e }.join(',')
    end
end

