yumrepo { 'olive':
    enabled => '1',
    failovermethod => 'priority',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/OLIVE-GPG-KEY',
    descr => 'Olive Fedora Repo - $basearch',
    baseurl => 'http://localhost/repo/$releasever/$basearch',
    proxy => '_none_'
}

yumrepo { 'olive-source':
    enabled => '0',
    failovermethod => 'priority',
    gpgcheck => '0',
    gpgkey => 'file:///etc/pki/rpm-gpg/OLIVE-GPG-KEY',
    descr => 'Olive Fedora Repo - $basearch - Source',
    baseurl => 'http://localhost/repo/$releasever/SRPMS',
    proxy => '_none_'
}

