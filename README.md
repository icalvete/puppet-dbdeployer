# puppet-dbdeployer

Puppet manifest to install dbdeployer 

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-dbdeployer.png)](http://travis-ci.org/icalvete/puppet-dbdeployer)

See [dbdeployer site](https://www.dbdeployer.com/)

## Example:

```puppet
node 'ubuntu01.smartpurposes.net' inherits test_defaults {
  include dbdeployer
}
```

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
