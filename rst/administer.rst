==========================
Administer your containers
==========================


Containers
==========

Update your 'running' container
-------------------------------

You can update your running container with a new version of Janitoo.

For example, to update the NUT docker appliance. Delete the 'running' container :

.. code:: bash

    $ docker rm nut_running

Pull the image release :

.. code:: bash

    $ docker pull bibi21000/janitoo_nut

And create a new 'running' container :

.. code:: bash

    $ docker create --volumes-from nut_store -p 8883:22 --name nut_running bibi21000/janitoo_nut


Backup your 'store' container
-----------------------------


Remove old containers
---------------------

Images
======


You can also attach a started 'running' container to get a look at the top command:

.. code:: bash

    $ docker attach hostsensor_running

To detach use ctrl + p + ctrl + q

