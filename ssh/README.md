# README
version v0.3

12/01/2014

Useful ssh scripts

[Wilfrido Vidaña](http://www.fidomenal.com)

******
# Copyright
Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License v3

******
# Requirements
Tested under xfce4-terminal

******
# How To sshauto
Open multiple ssh+screen terminals (default terminal xfce4-terminal)

* The equivalent command would be: 
```
terminal -x ssh -t root@host screen -D -R
```
* For first use execute with no arguments (interactive shell)
```
sshauto
```
* Regular Usage
```
sshauto host1 host2...
```
* For "one time" using different domain
```
sshauto -d domain host1 host2 host3...
```
* Another regular options
```
-h | --help)
	prints this help
-v | --version)
	prints current version
```
******
