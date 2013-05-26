# Basic module for managing molly-guard and its configuration
# Copyright (C) 2012 Yoann Laissus <yoann.laissus@gmail.com>
# See LICENSE for the full license granted to you.

class mollyguard(
        $always_query_hostname = false
) {
	package { molly-guard:
		ensure => installed,
	}

	file { "/etc/molly-guard/rc":
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 644,
		content => template("mollyguard/rc.erb"),
		require => Package['molly-guard']
	}
}
