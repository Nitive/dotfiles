#!/usr/bin/python

"""
Ansible asdf module
Allow install asdf plugins
"""

from ansible.module_utils.basic import AnsibleModule


def main():
    "asdf ansible module"
    module = AnsibleModule(
        argument_spec=dict(
            plugin=dict(default='', type='str'),
        )
    )

    def get_plugins_list():
        "get currently installed plugins list"
        (code, stdout, stderr) = module.run_command(
            'asdf plugin list')
        if code != 0:
            module.fail_json(msg=stderr)
        return set(stdout[0:-1].split('\n'))

    def install_plugin(name):
        "install plugin and send fail in case of error"
        code, _, stderr = module.run_command(
            'asdf plugin add ' + name)
        if code != 0:
            module.fail_json(msg='Failed to install `' + name + '`: ' + stderr)

    plugin = module.params['plugin']
    installed = plugin in get_plugins_list()

    if not installed:
        install_plugin(plugin)

    module.exit_json(changed=not installed)


if __name__ == '__main__':
    main()
