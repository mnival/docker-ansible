Docker docker-mediawiki
============

Configuration Docker with python:slim with pip package ansible and Debian package openssh-client

Quick Start
===========
    docker run -it -v /data/ansible:/work:ro -v ~/.ssh:/root/.ssh:ro -v /data/ansible/.ansible.cfg:/root/.ansible.cfg:ro --rm mnival/docker-ansible:latest ansible-playbook -i /work/playbook/inventory.yml /work/playbook/playbook.yml

Interfaces
===========

Ports
-------

Volumes
-------

Maintainer
==========

Please submit all issues/suggestions/bugs via
https://github.com/mnival/docker-ansible
