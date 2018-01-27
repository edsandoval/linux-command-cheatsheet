This post summarizes my experience in setting up a test environment for cassandra cluster using CentOS VMs.

Suppose we are to setup the cassandra cluster on two VMs cassanra01/192.168.56.131 and cassanra02/192.168.56.132 (link: http://czcodezone.blogspot.sg/2016/03/setup-centos-vm-in-virtualbox-for.html).

Perform all the steps below on each VM:

specify the /etc/hosts as follows:
192.168.56.131 cassandra01
192.168.56.132 cassandra02

Run the following command the install the required softwares:

```bash
`yum install -y java-1.8.0-openjdk-devel

Add the following line in .bashrc:

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

Download and unzip the cassandra package to "/root/cassandra", create a folder
"/root/cassandra_data" and create the following subfolders:

/root/cassandra_data/data
/root/cassandra_data/log
/root/cassandra_data/cache

Run the followng command to set the write permission for "cassandra_data"
folder:
```bash
`chmod 755 -R /root/cassandra_data

Run the following command to start editing cassandra/conf/cassandra.yml

In the cassandra.yml, edit the following lines (e.g., change "rpc_address: localhost" to "rpc_address: [ipv4_address of the current VM]" as well as "listen_address"; otherwise commented out both "listen_address" and "rpc_address"):

#listen_address: localhost
#rpc_address: localhost
data_file_directories:
 - /root/cassandra_data/data
commitlog_directory: /root/cassandra_data/log
saved_caches_directory: /root/cassandra_data/cache
cluster_name: 'myCluster'
seed_provider:
  - seeds: "cassandra01,cassandra02"

Start the cassandra by running the following command ("-R" to trigger it in root user):

```bash
`cassandra/bin/cassandra -R -f

Or ("nohup" to run process which wont be interrupted by SIGNUP, and "&" put the job into the background):

```bash
`nohup cassandra/bin/cassandra -R -f &

Stop the cassandra by running the following command:

or

```bash
`kill -9 `ps -ef | grep cassandra | awk '{print $2}'`

To check if cassandra is running:

```bash
``ps -ef | grep cassandra


Note that by default firewalld will block all the ports including those used by cassandra, a simple (but not safe) solution is to turn off the firewalld by running
the following commands:

```bash
`systemctl stop firewalld.service
`systemctl disable firewalld.service

To monitor the cassandra cluster, run the following command:

```bash
`cassandra/bin/cqlsh cassandra01

Or

`cassandra/bin/nodetool cfstats

Or

`cassandra/bin/nodetool ring
