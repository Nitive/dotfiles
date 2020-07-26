install:
	ansible-playbook -K playbooks/all.yml

install-no-pass:
	ansible-playbook playbooks/all.yml

install-no-password:
	ansible-playbook playbooks/all.yml --skip-tags=require_password

vim:
	ansible-playbook playbooks/vim.yml

install-ansible:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ansible

.PHONY: install install-ansible test
