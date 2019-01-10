class dbdeployer (

  $install_dir = $dbdeployer::params::install_dir

) inherits dbdeployer::params {

  anchor {'dbdeployer::begin':
    before => Class['dbdeployer::install']
  }
  class {'dbdeployer::install':
    require => Anchor['dbdeployer::begin']
  }
  class {'dbdeployer::config':
    require => Class['dbdeployer::install']
  }
  class {'dbdeployer::service':
    subscribe => Class['dbdeployer::config']
  }
  anchor {'dbdeployer::end':
    require => Class['dbdeployer::service']
  }
}
