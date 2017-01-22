#!/usr/bin/python

"""
Ansible vscode module
Allow install extensions
"""

from ansible.module_utils.basic import AnsibleModule

def main():
    "vscode ansible module"
    module = AnsibleModule(
        argument_spec=dict(
            extensions=dict(default=[], type='list')
        )
    )

    def get_extensions_list():
        "get currently installed extensions list"
        (code, stdout, stderr) = module.run_command('code --list-extensions')
        if code != 0:
            module.fail_json(msg=stderr)
        return set(stdout[0:-1].split('\n'))

    def install_extension(name):
        "install extensions and send fail in case of error"
        code, _, stderr = module.run_command('code --install-extension ' + name)
        if code != 0:
            module.fail_json(msg='Failed to install `' + name + '`: ' + stderr)

    extensions = set(module.params['extensions'])
    installed_extensions = get_extensions_list()
    not_installed = [ext for ext in extensions if ext not in installed_extensions]

    for ext in not_installed:
        install_extension(ext)

    module.exit_json(changed=not set.issubset(extensions, installed_extensions))

if __name__ == '__main__':
    main()
