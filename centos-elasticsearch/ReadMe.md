# Version to Install

By default, CentOS yum has elasticsearch 2.x available for install. However, due to issues such as incompatible data type (such as "text" and "keyword" in ElasticSearch 6.x is the "string" data type in elasticsearch 2.x), you may want to upgrade to 6.x on CentOS.

To check which version of ElasticSearch running on your computer, run the following command:

```bash
yum info elasticsearch
```

# Install ElasticSearch 6.x on CentOS

Follow this link to install ElasticSearch 6.x on CentOS

https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html

# Allow Remote Access to ElasticSearch from another computer

By default, ElasticSearch set the host to localhost which prevents remote access for some network. This should
be change to 0.0.0.0 in the /etc/elasticsearch/elasticsearch.yml. Follow the link below on how:

https://www.tutorialjinni.com/enable-remote-access-in-elasticsearch-on-centos-7.html