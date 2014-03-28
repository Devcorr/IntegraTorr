#!/bin/bash

# This script acts as the command line client for integartorr.

echo $1

ansible-playbook -i {{ integratorr_home }}/local {{ integratorr_work }}/{{ integratorr_config }}/ansible/$1.yml
