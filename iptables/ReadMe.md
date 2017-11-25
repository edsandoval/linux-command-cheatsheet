iptables as the firewall setup and configured. (by default firewalld is the centos7 default firewall, the iptables is used for illustration)

To install iptables, run the following command:

<pre>
sudo systemctl stop firewalld
sudo systemctl mask firewalld
sudo yum install iptables
sudo yum install iptables-services
sudo systemctl enable iptables
sudo systemctl start iptables
</pre>

To add the list of blocked ip, run the following command (note that it is only in memory ip tables configuration)

```bash
#!/usr/bin/env bash

bin=`dirname "${BASH_SOURCE-$0}"`
pwd=`pwd`
current_dir=$pwd/$bin

sudo systemctl restart iptables

echo "Delete default access rules in iptables"
sudo iptables -F

for IP in $(wget -O - http://www.ipdeny.com/ipblocks/data/countries/hk.zone)
do
echo "Add accept rule for $IP from hongkong, for example"
sudo iptables -A INPUT -p tcp -s $IP --dport 22 -j ACCEPT
done

echo "Add reject rule for all other ips"
sudo iptables -A INPUT -p tcp --dport 22 -j DROP

```
