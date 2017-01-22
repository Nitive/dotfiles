export ANSIBLE_LIBRARY=./modules
export ANSIBLE_INVENTORY=local

install:
	ansible-playbook playbook.yml

test:
	ansible-playbook --tags=test -vvv playbook.yml

.PHONY: install test
