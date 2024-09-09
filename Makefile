#
# ansible collection test makefile
#

namespace = rstms_ansible
collection = vmware
version != cat VERSION
roles_src != find roles -type f
src = $(roles_src) VERSION galaxy.yml
tarball = $(namespace)-$(collection)-$(version).tar.gz
codename := '$(shell wonderwords -wpadjective)-$(shell wonderwords -wpnoun)'
latest_release != gh release list -L 1 --json tagName --jq '.[]|.tagName' | tr -d v

ifeq ($(shell git status --porcelain),'')
git_dirty = 
else
git_dirty = true
endif

ifeq ($(version),$(latest_release))
is_released = true
else
is_released = 
endif

#
# test config
#

host = testbox.rstms.net
vault = $(HOME)/.secrets/ansible_vault.yml
instance_config = example_instance_debian.yml
#instance_config = example_instance_openbsd.yml
playbook := example_playbook.yml

# 
# test targets
#

#debug:
#	@echo version=$(version)
#	@echo latest_release=$(latest_release)
#	@echo $(if $(is_released),released,not_released)
#	@echo git_dirty=$(git_dirty)

test: destroy create


help:
	ansible-doc -t role rstms_ansible.vmware.workstation_instance

ansible = ansible-playbook -vv -i $(host), --extra-vars @$(vault)  --extra-vars @$(instance_config) --extra-vars '{"insecure_expose_passwords": true}'

create:
	$(ansible) -e "vm_state=present" $(playbook)
	fixdns testbox

edit-vault:
	ansible-vault edit $(vault)

destroy:
	$(ansible) -e "vm_state=absent" $(playbook)


clean:
	rm -f *.tar.gz || true
	rm -rf .pytest_cache
	./mkdocs clean

$(tarball): $(src)
	rm -f *.tar.gz
	ansible-galaxy collection build --force

build: $(tarball)

docs: $(tarball)
	./mkdocs docs
	firefox file:///Z:/src/vmware/docs/build/html/index.html

release: docs
	git push
	$(if $(is_released),@echo latest_release is $(latest_release),gh release create v$(version) --target master --title "v$(version) $(codename)" --generate-notes)
	$(if $(is_released),,gh release upload v$(version) $(tarball))

publish: release
	ansible-galaxy collection publish --token $(ANSIBLE_GALAXY_TOKEN) $(tarball)
