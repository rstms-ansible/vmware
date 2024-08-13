# Collection: rstms_ansible.vmware

A collection of roles for managing VMWare Workstation instances

### netboot
TODO: describe netboot

### autoinstall
TODO: describe autoinstall

### roles
TODO: list and link to roles


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
