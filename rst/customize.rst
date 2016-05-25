=========================
Customize your containers
=========================


Security
========

SSH
---

Copy your key to the docker image to bypass the password :

.. code:: bash

    ssh-copy-id root@$127.0.0.1 -p 8882

Disable root login with password :

.. code:: bash

    sed -i -e "s/^#PermitRootLogin without-password/PermitRootLogin without-password/" /etc/ssh/sshd_config


Containers
==========

Use a common 'store' container
------------------------------


Create your own appliance image
===============================

