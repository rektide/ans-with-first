---
- hosts: all
  gather_facts: false
  vars:
   FILES:
   - a
   - b
   - c
  tasks:
  - template: src=$item dest=/tmp/with-first-$item
    with_items: $FILES
    first_available_file:
    - template-${item}
    - template-stock
