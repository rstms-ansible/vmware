rstms_ansible.vmware instance Role
========================

manage VMWare Workstation instances 

Requirements
------------

  - VMWare Workstation VMREST server
  - vmctl configured for VMREST API
  - netboot server
  - autoinstall server

Role Variables
--------------

See `roles/instance/vars/main.yml` for the variables used by this role

Dependencies
------------

  - python module rstms-vmwctl

Example Playbook
----------------

```yaml
- name: rstms.vmware example playbook

  hosts: testbox.example.org
  gather_facts: no
  vars:
    vm_os: OpenBSD

  roles:
    - instance
```

License
-------

GPL-3

