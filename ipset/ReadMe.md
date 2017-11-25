ipset can be used to block by country. 

To install ipset on centos, run the following commmand:

<pre>
sudo yum install ipset
</pre>

Use the following shell script to block ip from the list of countries

<pre>
for IP in $(wget -O - http://www.ipdeny.com/ipblocks/data/countries/{cn,ru,kr,pk,tw,au,hk}.zone)
do
# ban everything - block countryX
sudo ipset add geoblock $IP
done
</pre>

<pre>
sudo iptables -I INPUT -m set --set geoblock src -j DROP
</pre>
