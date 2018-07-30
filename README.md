vagrant-haproxy-example
========================

Example of HAProxy using Vagrant

# Vagrantfile
* It sets up a 3 Centos7 VM mini-network by Virtualbox: haproxy (192.168.1.2), web1 (192.168.1.12), and web2 (192.168.1.13)

* It installs HAProxy on the haproxy host, and places a configuration file.  

* It installs Apache httpd on the two web servers, and creates an index page that identifies which host you're viewing the page on.

# Prerequisites
1.  Install [Vagrant](http://www.vagrantup.com/downloads.html)
2.  Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3.  Clone this repo with ``` git clone https://github.com/zeusz/vagrant-haproxy-example ``` 

# Getting started
1.  Open a terminal and change to the directory containing the Vagrantfile from step 3 above.
2.  In terminal for haproxy, run ``` vagrant up ```
3.  Open up [http://192.168.1.2:8080/haproxy?stats](http://192.168.1.2:8080/haproxy?stats) in your host's browser.  This is the HAProxy status interface.
4.  Open up [http://192.168.1.2:80/](http://192.168.1.2:80/) in your host's browser.  This is the load balanced interface to the two web servers. 
5.  Open up [http://192.168.1.12/](http://192.168.1.12/) in a browser to see how web1 httpd is working.
6.  Open up [http://192.168.1.13/](http://192.168.1.13/) in a browser to see if web2 httpd is working.
7.  You can also verify haproxy and the web pages by targeting haproxy:``` curl -v http://192.168.1.2:80/ ``` or any webs: ``` curl -v http://192.168.1.12:80/ ```;``` curl -v http://192.168.1.13:80/ ``` 
8.  To stop Apache on one of the webservers to simulate an outage, log into one of them by ```vagrant ssh web1 ``` or ```vagrant ssh web2 ```, and run ``` sudo systemctl httpd stop ```  To start it again, run ``` sudo systemctl httpd start ```
9. You can also stop one web VM to simulate an outage, like ``` vagrant halt web1 ``` - to restart ``` vagrant halt web1 ```
10.  To shut down the VM's, run ``` vagrant halt ``` (use names of VMs if you have additionals then in this example)
11.  To remove the VM's from your hard drive, run ``` vagrant destroy web1 web2 haproxy ```
12.  If you wish to remove the cached image file from which these machines were created, run ``` vagrant box remove centos/7 ```

# Reference material
* [Vagrant](http://vagrantup.com)
* [VirtualBox](http://www.virtualbox.org)
* [HAProxy](http://haproxy.1wt.eu/)


