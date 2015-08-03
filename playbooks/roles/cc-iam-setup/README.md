Role Name
=========

This role is used to setup all IAM required resources to demostrate a Role Based Access Control (RBAC) implementation for AWS CodeCommit.

Requirements
------------

All of the Ansible AWS modules require you to install the Python Boto library as a Python system package on the control machine.

Role Variables
--------------

- cc_operator_user: username of the CodeCommit Operator
- cc_operators_group: group name that contains CodeCommitOperator Users
- cc_operators_policy: policy name that grants rights to the CodeCommit operators (the policy name must be identical to the policy filename located in /files) 
- alpha_committer_user: username of the Project Alpha committer
- alpha_committers_group: group name that contains Project Alpha committers
- alpha_committers_policy: policy name that grants rights to the Project Alpha Committers group (the policy name must be identical to the policy filename located in /files)
- alpha_puller_user: username of the Project Alpha puller
- alpha_pullers_group: group name that contains Project Alpha pullers
- alpha_pullers_policy: policy name that grants rights to the Project Alpha Pullers group (the policy name must be identical to the policy filename located in /files)
- bravo_committer_user: username of Project Bravo Committer
- bravo_committers_group: group name that contains Project Bravo committers
- bravo_committers_policy: policy name that grants rights to the Project Bravo Committers group (the policy name must be identical to the policy filename located in /files)
- bravo_puller_user: username of the Project Bravo puller
- bravo_pullers_group: group name that contains Project Bravo pullers
- bravo_pullers_policy: policy name that grants rights to the Project Bravo Pullers group (the policy name must be identical to the policy filename located in /files)

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      roles:
         - { role: cc-iam-setup }

License
-------

BSD

Author Information
------------------

shayne.clausson@stelligent.com
