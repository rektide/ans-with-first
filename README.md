Use case
========

I'd like to generate a bunch of /etc/bind9/zone.d/${zone_name}.zone files. These files ought either come from a _stock.zone template, or, if available, a ${zone_name}.zone file.

Status
======

At present this `ansible-playbook with-first.pb` gives `ERROR: with_(plugin), and first_available_file are mutually incompatible in a single task`. This result is in accord with https://github.com/ansible/ansible/issues/552 , `Make with_items and first_available_file usable together or otherwise warn`, which this script attempts to do.

Hope
====

with_item and first_available_file both collide with the $item variable. Rather than forbid this clobbering outright, provide a non-colliding codepath where both can be used: with_{plugin} to iterate through the action multiple times, and first_available_file to look for targets within a single run. with-first.disambiguated.pb demonstrates such a non-colliding path, making use of distinct ${firstAvailableFile} and ${item} files.

For backwards compatibility sake, ${item} can continue to be set by first_available_file in all cases where with_{plugin} is not used.
