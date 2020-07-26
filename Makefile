.PHONY: *

install-all:
	ansible-playbook --skip-tags require_password playbooks/all.yml

install-become:
	ansible-playbook -K --tags require_password playbooks/all.yml

install-no-password:
	ansible-playbook playbooks/all.yml --skip-tags=require_password

install-ansible:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ansible

install-%: tasks/%.yml
	@ task=$< ansible-playbook --skip-tags require_password playbooks/task.yml
