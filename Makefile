#
# ansible collection test makefile
#

namespace = rstms_ansible
collection = vmware
version != cat VERSION
roles_src != find roles -type f
src = $(roles_src) VERSION galaxy.yml
tarball = $(namespace)-$(collection)-$(version).tar.gz

#
# test config
#

host = testbox.rstms.net
vault = $(HOME)/.secrets/ansible_vault.yml
playbook := example_playbook.yml

vars := \
  vm_os=OpenBSD\
  vm_version=7.5\
  vm_secrets_file=example_secrets.yml\
  vm_filesystem_dir=$(PWD)/example_instance_filesystem

# 
# test targets
#

test: destroy create

ansible = ansible-playbook -vv -i $(host), --extra-vars @$(vault)  $(foreach var,$(vars),--extra-vars '$(var)' )

create:
	$(ansible) -e "vm_state=present" $(playbook)

edit-vault:
	ansible-vault edit $(vault)

destroy:
	$(ansible) -e "vm_state=absent" $(playbook)


clean:
	rm -f *.tar.gz || true
	rm -rf .pytest_cache

#
# version management
#
bumper = $(if $(shell git status --porcelain),$(error Working tree is dirty),@bumpversion $(1) && git push && git log --decorate=short | head -1)
bump:
	$(call bumper,patch)
bump-minor: 
	$(call bumper,minor)
bump-major: 
	$(call bumper,major)

#
# ansible-galaxy 
#
$(tarball): $(src)
	ansible-galaxy collection build --force

build: $(tarball)

publish: build
	ansible-galaxy collection publish --token $(ANSIBLE_GALAXY_TOKEN) $(tarball)
