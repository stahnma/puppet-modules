class gitlab {
    $gitlabpkgs = [ 'redis', 'gitolite', 'python', 'python-devel', 'sendmail', 'libicu-devel', 'python-pip' ]
    $rubies = [ 'ruby', 'rubygems', 'rubygem-rake','ruby-irb', 'ruby-devel'  ]

    package { $gitlabpkgs:
        ensure => installed,
        require => [ Package[$rubies] ],
    }

    # only works on el6
    yumrepo { "stahnma-ruby":
        baseurl => 'http://stahnma.fedorapeople.org/ruby/el/6/$basearch' ,
        gpgcheck => 0,
        descr => "stahnma fedorapeople ruby 1.9.3 project",
        enabled => 1,
    }

    package {  $rubies:
        ensure => latest,
        require => [ Yumrepo['stahnma-ruby'] ] ,
    }

    # fuck you bundler
    package { "bundler":
        ensure => installed,
        provider => gem,
        require => [ Package[$rubies] ],
    }
}
