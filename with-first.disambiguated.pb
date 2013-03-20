---
- hosts: all
  gather_facts: false
  vars:
   ZONES:
   - yoyodyne.net
   - example.com
   - example.net
  tasks:
  - template: src=${firstFile} dest=/tmp/with-first.${item}.zone
    with_items: $ZONES
    first_available_file:
    - ${item}.zone
    - _stock.zone
