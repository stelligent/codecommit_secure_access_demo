# codecommit_secure_access_demo

## Intention
Demonstrates the ability to implement Role Based Access Control (RBAC) for AWS CodeCommit.

## Requires setup of CodeCommit Repos
Four CodeCommit repos should be setup in order to demonstrate granular access to each:

- project-alpha-foo
- project-alpha-bar
- project-bravo-foo
- project-bravo-bar

## User access
We are creating four ficticious users: 
- Alice: can commit to project-alpha-* repos
- Bob: can pull project-alpha-* repos
- Carol: can commit to project-bravo-* repos
- Dave: can pull project-bravo-* repos

## Setup via Ansible

### playbooks/cc-iam-setup.yml
Running this playbook will create IAM Users, Groups, Roles and attach Policies that will provide RBAC to CodeCommit.

### playbooks/cc-client.yml
Running this playbook will provision a Vagrant VM as follows:
- Creates users: alice, bob, carol, dave
- sets up SSH access for each user
- Installs git

## Test access controls
ssh into the Vagrant vm
- Test pulling repos
```sh
su username
cd ~/repos
git pull $ALPHA_FOO_REPO
# should be ok for Alice and Bob
# should receive 'access denied' for Carol and Dave
```
- Test pushing changes
```sh
cd project-alpha-foo
echo 'changes are coming' > changes.txt
git add changes.txt
git commit -m "I made a change"
git push -u origin master
# should be ok for Alice
# should receive 'access denied' for Bob
```

Environment variables exist for each repo URL to make things easier.
- $ALPHA_FOO_REPO
- $ALPHA_BAR_REPO
- $BRAVO_FOO_REPO
- $BRAVO_BAR_REPO

Thus if you want to attempt to clone project-alpha-foo:
```sh
git clone $ALPHA_FOO_REPO
```
