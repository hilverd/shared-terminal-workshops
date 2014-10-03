#! /bin/bash

set -o errexit

vagrant up --provision

vagrant ssh -c /home/vagrant/presenter-session.sh
