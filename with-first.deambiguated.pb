---
- hosts: all
  gather_facts: false
  vars:
   FILES:
   - a
   - b
   - c
  tasks:
  - template: src=$first_file dest=/tmp/with-first-$item # produces: with-first-a, with-first-b, with-first-c
    with_items: $FILES
    first_available_file:
    - template-${item}
    - template-stock
