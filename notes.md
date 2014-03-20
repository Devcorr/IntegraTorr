User creates a hidden integrator config file in their home dir.
User could store this in ConfigCorr or the Project dir and deploy to vagrant vm via ansible.
Config file contains git repos to pull down and that's about it.

Installation of Integratorr on a remote vm would follow a few steps:
1. User places integratorr config in homedir of user that will run integratorr
2. Remote machine user must have ssh access to the desired project repos
3. Remote machine must have git and ansible installed
2. User clones integratorr git repo
3. User runs integratorr setup via ansible which uses config file to download appropriate git repos

ConfigCorr/Project dir contains the build scrips that integrator will run.

Integrator is deployed to VMs via ansible. Integration installation playbooks could live in ConfigCorr or the user's project dir.

Integrator setup is very bare bones, it sets up git then pulls configcorr to leverage all the ansible roles that live there.

Should ConfigCorr be a public repo which Integrator uses like a core library of ansible roles,
or should should every user provide their own ConfigCorr-esque repo with the roles and personalization they need?
