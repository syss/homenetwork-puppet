# Changelog

## 2.0.0
* Add parameters to dhcp and dhcp:pool to configure static routes
* Change theforeman-concat_native to puppetlabs-concat
* Fix quoting of domain-name option
* Test with future parser and Puppet 4

## 1.6.0
* Add `parameters`, `options` parameters to dhcp::pool
* Add `default_lease_time`, `max_lease_time` parameters to dhcp
* Use longer ISC defaults for lease times
* Minimising differences to puppetlabs/dhcp for eventual merger
* Do not set domain-name option if dnsdomain parameter is empty
* Strip pool config values before checking if they should be set
* Removing unused code, tidyups, better test coverage, increased linting

## 1.5.0
* Add nameservers parameter to dhcp::pool
* Fix config output when empty pool range is passed

## 1.4.0
* Add pxeserver parameter to dhcp::pool
* Unsetting pxeserver/pxefilename disables PXE in a subnet
* Add tests, fix lint and style issues

## 1.3.1
* Change Debian package name to prevent reinstallation on each run
* Fix puppet-lint issues
