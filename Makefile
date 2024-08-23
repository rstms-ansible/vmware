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
instance_config = example_instance_debian.yml
playbook := example_playbook.yml

# 
# test targets
#

test: destroy create

ansible = ansible-playbook -vv -i $(host), --extra-vars @$(vault)  --extra-vars @$(instance_config)

create:
	$(ansible) -e "vm_state=present" $(playbook)

edit-vault:
	ansible-vault edit $(vault)

destroy:
	$(ansible) -e "vm_state=absent" $(playbook)


clean:
	rm -f *.tar.gz || true
	rm -rf .pytest_cache
	./mkdocs clean

#
# ansible-galaxy 
#
$(tarball): $(src)
	ansible-galaxy collection build --force

build: $(tarball)

.PHONY: docs
docs: $(tarball)
	./mkdocs

publish: docs
	ansible-galaxy collection publish --token $(ANSIBLE_GALAXY_TOKEN) $(tarball)
