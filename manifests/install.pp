class dbdeployer::install {

  file{ 'dbdeployer_install_dir':
    ensure => directory,
    path   => $dbdeployer::install_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  wget::fetch { 'download_dbdeployer':
    source      => "https://github.com/datacharmer/dbdeployer/releases/download/v1.16.0/dbdeployer-1.16.0.linux.tar.gz",
    destination => "${dbdeployer::install_dir}/dbdeployer-1.16.0.linux.tar.gz",
    timeout     => 0,
    verbose     => true,
    require     => File['dbdeployer_install_dir']
  }

  exec { 'extract_download_dbdeployer':
    command => "/bin/tar xfz ${dbdeployer::install_dir}/dbdeployer-1.16.0.linux.tar.gz",
    user    => 'root',
    cwd     => $dbdeployer::install_dir,
    unless  => "/usr/bin/test -f ${dbdeployer::install_dir}/dbdeployer-1.16.0.linux",
    require => Wget::Fetch['download_dbdeployer']
  }
  
  file { "symlink_dbdeployer":
    ensure  => link,
    path    => "/usr/bin/dbdeployer-1.16.0.linux",
    target  => "${dbdeployer::install_dir}/dbdeployer-1.16.0.linux",
    require => Exec['extract_download_dbdeployer']
  }
}
