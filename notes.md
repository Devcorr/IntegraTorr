Open questions
---------------------

* How will the dev run Integratorr build plans from the host machine? Or will they just run them from a terminal that's ssh'd into the vagrant VM? If a web frontend for integratorr will eventually run in the Vagrant vm, maybe a simple commandline client available on the host that talks to an integratorr rest api would be good? Not unlike the docker client/daemon.

* How should the user deploy Integratorr config files (containing info like integratorr_home, integratorr_work, etc) when installing Integratorr on a new machine?

* How should global variables (like integratorr_home) be made available to each project's build scripts?

* Should ConfigCorr be a public repo which Integrator uses like a core library of ansible roles, or should should every user provide their own ConfigCorr-esque repo with the roles and personalization they need?

* How will we stream stdout for builds and such, since ansible doesn't provide live output? Create some wrapper binary that can stream the logs to the Integratorr client on the host or something?


To do
--------------------------

It might be nice if Integratorr provided some common ansible roles available to all builds out of the box. Ansible allows you to specify a "roles_path" for default roles. Problem is you can only have one "roles_path", and the only other place Ansible checks for roles is the current playbook directory. I could imagine a scenario where a user wants roles in a project dir AND their own internal "common" roles repository, at which point Integratorr would screw them over if it monopolizes roles_path. What Integratorr could do is parse a conventional location for roles in all user repositories, or in a specified Integratorr config repo like configcorr, and symlink all of those roles into the roles_path.

Getting started with Integratorr in Vagrant
--------------------------------------------

1. Clone Integratorr repo on your dev machine
2. Call Vagrant Up
3. Add .integratorr.yml to vagrant's homedir in the VM (script this?)
4. Run install.yml against the VM with ansible (can be run in VM or from host)

install.yml will set up Integratorr and pull down the user's Git repos listed in .integratorr.yml. Integratorr will parse the repos and set up build jobs. Recommended approach will be to put all build jobs in a repo like configcorr so that ansible roles, dockerfiles, and build artifacts can be shared across projects. Vagrantfile should be set up to share the Integratorr work-dir where the user repos are cloned with the host machine. These will serve as the Dev's working copies of their projects where they point their IDEs and editors. Sharing the directory allows the dev to use their preferred tools on their preferred platform while keeping tasks like compilation and deployment in a VM with a prod like environment.

**Thought** Instead of specifying the user projects in .integratorr.yml, maybe just make it a parameter for install.yml, or create a command that can be run in the VM like "integratorr project add repo-url repo-name"

Vagrantfile should remain pretty slim. Other than the Ansible provisioner, most special vagrant features should be avoided (e.g. don't rely on vagrant to install docker for you). For the most part the vagrant VM should be treated the same as any remote build machine. If some dependency is needed, it should be installed the same way that it would be installed on a regular build box. This will keep things simple and DRY.

Installation of Integratorr on a remote vm
---------------------------------------------

1. User places integratorr config in homedir of user that will run integratorr
2. Remote machine user must have ssh access to the desired project repos
3. Remote machine must have git and ansible installed
4. User clones integratorr git repo
5. User runs integratorr setup via ansible which uses config file to download appropriate git repos

Notes
----------------------------

Integratorr commandline tool should offer features that make it easier to manage many projects, like the ability to fetch changes from all your git repos with a single command.

ConfigCorr/Project dir contains the build scrips that integrator will run.
