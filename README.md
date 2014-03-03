vagrant-mongodb
===============

Prerequisites :
 - Install Virtual box (tested on 4.2.22)
 - Install Vagrant (tested on 1.4.3)
 - Ensure vagrant directory is in your path


From the command line to

Start the VM invoke :
 - vagrant up
VM will be created and provisionned on the fly if not already on your machine

Stop the VM invoke :
 - vagrant halt

Drop the VM invoke :
 - vagrant destroy




Particular notes :
apt-cache directory is a empty directory versionned. We should never commit anything inside it. It just acts as debian package cache for your local machine (that survive to vagrant destroy).
