# Ansible Collection - rstms.vmware

A role for managing VMWare Workstation VM instances using netboot and autoconfig

### netboot
TODO: describe netboot

### autoinstall
TODO: describe autoinstall

### Role Variables
TODO: add variable descriptions

### Usage Notes

#### Root password generation
A random root password is generated for a created instance.
If the variable `vm_secrets_file` is set, generated password will be written with `ansible-vault` as `<vm_hostname>_root`
Decryption command:
```
ansible-vault decrypt secrets.yml --output - | jq -r .examplehost_root
```
