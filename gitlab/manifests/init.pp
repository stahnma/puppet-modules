class gitlab {

	$gitlabpkgs = [ 'redis', 'gitolite', 'python', 'python-devel', 'sendmail', 'libicu-devel', 'python-pip', 'make', 'gcc', 'autoconf', 'gcc-c++', 'sqlite-devel' ]

	$rubies = [ 'ruby', 'rubygems', 'rubygem-rake','ruby-irb', 'ruby-devel' , 'rubygems-devel', 'libxslt-devel', 'libxml2-devel'  ]

	package { $gitlabpkgs:
		ensure => installed,
		require => [ Package[$rubies] ],
	}

	package {  $rubies:
		ensure => latest,
	}

	# fuck you bundler
	package { "bundler":
		ensure => installed,
		provider => gem,
		require => [ Package[$rubies] ],
	}

	file { "/srv":
		ensure => directory,
	}

	exec { "gitlab-install":
		unless    => "[ -d /srv/gitlabhq ]",
		cwd       => "/srv",
		path      => "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin",
		command   => "git clone git://github.com/gitlabhq/gitlabhq.git",
		logoutput => true,
		require   => [ Package[$gitlabpkgs], File['/srv'], Package['bundler'] ], 
	}

	exec { "bundle-install":
		cwd       => "/srv/gitlabhq",
		path      => "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin",
		command   => "bundle install  --without development test",
		logoutput => true,
		require   => [ Package[$gitlabpkgs], File['/srv'], Package['bundler'], Exec['gitlab-install']  ], 
	}

	exec { "bundle-db-setup":
		cwd       => "/srv/gitlabhq",
		path      => "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin",
		command   => "bundle exec rake db:setup RAILS_ENV=production",
		logoutput => true,
		require   => [ Package[$gitlabpkgs], File['/srv'], Package['bundler'], Exec['gitlab-install'] , Exec['bundle-install']  ], 
	}
}

