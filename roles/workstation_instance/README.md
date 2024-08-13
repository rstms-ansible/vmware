rstms_ansible.vmware workstation_instance Role
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

See `roles/workstation_instance/vars/main.yml` for the variables used by this role

Dependencies
------------

  - python module rstms-vmwctl

Example Playbook
----------------

```yaml
- name: rstms.vmware example playbook

  hosts: vmbox.example.org
  gather_facts: no
  vars:
    vm_os: OpenBSD

  roles:
    - rstms_ansible.vmware.workstation_instance
```

License
-------

GPL-3

