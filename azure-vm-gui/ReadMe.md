# On the gui-desktop VM, run the following commands install desktop gnome:

* sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
* sudo yum groupinstall "GNOME Desktop" "Graphical Administration Tools"

If you want to configure default access by GUI instead of console, run the following command:

* sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target 

At this point, you need to upgrade your firefox:

* sudo yum update firefox

# Enable remote desktop 

Run the following command to setup rdp using tigervnc:

* sudo yum -y install xrdp tigervnc-server
* sudo systemctl start xrdp.service
* sudo systemctl enable xrdp.service

Run the following command to check the status of the rdp:

* sudo netstat -antup | grep xrdp

(Note that the port 3389 must be made available for rdp to work)



