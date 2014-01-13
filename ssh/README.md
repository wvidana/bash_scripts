# README
version v0.2

12/01/2014

Useful ssh scripts

[Fido Vidaña](http://www.fidomenal.com)

******
# Copyright
Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License v3

******
# Requirements
Tested under xfce4-terminal

******
# How To sshauto

Open multiple ssh+screen terminals (default termianl wfce4-terminal)
```
	Use:	sshauto host1.domain.example host2.domain.example...
		-d | --domain)
				sshauto -d domain host1 host2 host3...
		-s | --server)
			Use the variable DOM_sshauto as default domain
			write 'export DOM_sshauto=domain' without quotes if you want to set this variable
			then execute the script like follows:
				sshauto -s host1 host2 host3...
		-h | --help)
			prints this help
		-v | --version)
			prints current version
		-t | --terminal)
			change the default terminal:
				sshauto -t example-terminal
```
******
