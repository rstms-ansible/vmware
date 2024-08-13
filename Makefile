#
# ansible collection test makefile
#

host = testbox.rstms.net
vault = $(HOME)/.secrets/ansible_vault.yml
role := instance
playbook := example_playbook.yml

vars := \
  vm_os=OpenBSD\
  vm_version=7.5\
  vm_secrets_file=example_secrets.yml\
  vm_filesystem_dir=$(PWD)/example_instance_filesystem

rebuild: destroy create

ansible = ansible-playbook -vv -i $(host), --extra-vars @$(vault)  $(foreach var,$(vars),--extra-vars '$(var)' )

create:
	$(ansible) -e "state=present" $(playbook)

edit-vault:
	ansible-vault edit $(vault)

destroy:
	$(ansible) -e "state=absent" $(playbook)

clean: destroy
	rm -f *.tar.gz || true

bumper = $(if $(shell git status --porcelain),$(error Working tree is dirty),@bumpversion $(1) && git log --decorate=short | head -1)

bump:
	$(call bumper,patch)

bump-minor: 
	$(call bumper,minor)

bump-major: 
	$(call bumper,major)

build: bump
	ansible-galaxy build
