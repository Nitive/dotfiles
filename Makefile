export ANSIBLE_LIBRARY=./modules
export ANSIBLE_INVENTORY=local

install:
	ansible-playbook playbook.yml

install-ansible:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ansible

test:
	ansible-playbook --tags=test -vvv playbook.yml

.PHONY: install install-ansible test
