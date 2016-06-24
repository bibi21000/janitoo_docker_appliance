==========================
Administer your containers
==========================


Containers
==========

Create your 'store' container
-----------------------------

After your first installation, you need to create the store container :

.. code:: bash

    $ make docker-local-store

You should get something like :

.. code:: bash

    Pull local docker for janitoo_audiovideo.
    docker pull bibi21000/janitoo_audiovideo
    Using default tag: latest
    latest: Pulling from bibi21000/janitoo_audiovideo
    Digest: sha256:3c038846fc521d2c7e3b46778dedc37c7c363f7b21ca93aca816030d9cd58e8b
    Status: Image is up to date for bibi21000/janitoo_audiovideo:latest

    Docker local for janitoo_audiovideo pulled.

    Create docker local store for janitoo_audiovideo.
    docker create -v /root/.ssh/ -v /opt/janitoo/etc/ --name audiovideo_store bibi21000/janitoo_audiovideo /bin/true
    511e799c1a763b039df2772a9b874d79c5473dafc4f84418bbae79e9e6e10c14

    Docker local store for janitoo_audiovideo created.

It's possible to personnalize the port used for ssh. Create or update your local Makefile :

.. code:: bash

    $ vim Makefile.local

And add :

.. code:: bash

    DOCKERPORT   = 8882


Update your 'running' container
-------------------------------

You can update your running container.

For example, to update the NUT docker appliance. Delete the 'running' container :

.. code:: bash

    $ make docker-local-running

You should get something like :

.. code:: bash

    Pull local docker for janitoo_audiovideo.
    docker pull bibi21000/janitoo_audiovideo
    Using default tag: latest
    latest: Pulling from bibi21000/janitoo_audiovideo
    Digest: sha256:3c038846fc521d2c7e3b46778dedc37c7c363f7b21ca93aca816030d9cd58e8b
    Status: Image is up to date for bibi21000/janitoo_audiovideo:latest

    Docker local for janitoo_audiovideo pulled.

    Update local docker for janitoo_audiovideo.
    docker stop audiovideo_running
    Error response from daemon: No such container: audiovideo_running
    make: [docker-local-running] Erreur 1 (ignorée)
    docker rm audiovideo_running
    Error response from daemon: No such container: audiovideo_running
    make: [docker-local-running] Erreur 1 (ignorée)
    docker create --volumes-from audiovideo_store -p 8886:22 --name audiovideo_running bibi21000/janitoo_audiovideo
    f4c65d518ad8862b0d2873d1798ffa655d05f77e3b96fd7675db143c9cf1564e
    docker ps -a|grep audiovideo_running
    f4c65d518ad8        bibi21000/janitoo_audiovideo   "/root/auto.sh"     Less than a second ago   Created                                    audiovideo_running
    docker start audiovideo_running
    audiovideo_running
    docker ps|grep audiovideo_running
    f4c65d518ad8        bibi21000/janitoo_audiovideo   "/root/auto.sh"     1 seconds ago       Up Less than a second   0.0.0.0:8886->22/tcp   audiovideo_running

    Docker local for janitoo_audiovideo updated.

You got a new 'running' container available on ssh port 8886 :

.. code:: bash

    f4c65d518ad8        bibi21000/janitoo_audiovideo   "/root/auto.sh"     1 seconds ago       Up Less than a second   0.0.0.0:8886->22/tcp   audiovideo_running


Backup your 'store' container
-----------------------------

docker run --volumes-from dbdata -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata


Remove old containers
---------------------

Minimal installation
--------------------

On a production system, you don't need to install Janitoo core on the system.

Simply clone the janitoo_docker_appliance repository :

.. code:: bash

    $ git clone https://github.com/bibi21000/janitoo_docker_appliance.git
    $ cd janitoo_docker_appliance
    
And create the 'store' container for the tellstick appliance :

.. code:: bash

    $ make docker-local-store MODULENAME=janitoo_tellstick DOCKERPORT=8888 DOCKERVOLS=" --privileged -v /dev/bus/usb:/dev/bus/usb"

You can retrieve all options (DOCKERPORT and DOCKERVOLS) from the Makefile in the MODULENAME repository on github.

And create the 'running' container :

.. code:: bash

    $ make docker-local-running MODULENAME=janitoo_tellstick


Images
======


You can also attach a started 'running' container to get a look at the top command:

.. code:: bash

    $ docker attach hostsensor_running

To detach use ctrl + p + ctrl + q

