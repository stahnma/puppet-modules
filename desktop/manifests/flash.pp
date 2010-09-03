class desktop::flash { 
 yumrepo { 'adobe':
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
    descr => 'Adobe Systems Incorporated',
    baseurl => 'http://linuxdownload.adobe.com/linux/i386/',
    enabled => '1',
    gpgcheck => '1'
 }
 
 $flashpkgs = [ 'flash-plugin', 'alsa-plugins-pulseaudio', 'libcurl' ] 

  package { $flashpkgs: 
    ensure => present, 
    require =>  [  Yumrepo['adobe'], File['adobe-key'] ] 
  } 

  file { "adobe-key":
    path =>  "/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux",
    ensure => present,
    source => "puppet:///modules/desktop/RPM-GPG-KEY-adobe-linux",
    owner => root,
    group => root,
    mode => 644,
    require => Yumrepo['adobe'],
  } 
}
