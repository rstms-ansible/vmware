# Ansible Collection - rstms.vmware

Role for management of VMWare Workstation VM instances

## Dependencies
TODO: describe dependencies

## Role Variables
TODO: add variable descriptions

## Root password generation
A random root password is generated when creating the new instance.
If the variable `vm_secrets_file` is set to a string, it will be used as an ansible_vault filename.  
The generated root password will be written as `<vm_hostname>_root: XXXXXXXX`
The root password may be decrypted with this command:
```
ansible-vault decrypt vm_secrets.yml --output - | jq -r .vmname_root
```
