install:
	ansible-playbook -i local playbook.yml

test:
	ansible-lint playbook.yml

.PHONY: install test
