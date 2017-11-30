# Install Redis

```bash
sudo yum install epel-release
sudo yum update
sudo yum install redis
sudo systemctl start redis
sudo systemctl enable redis
```

# Verify Installation

```bash
redis-cli ping
```

If Redis is running, it will return:

```text
PONG
```

# Basic System Tuning
To improve Redis performance, set the Linux kernel overcommit memory setting to 1:
  
```bash
sudo sysctl vm.overcommit_memory=1
```

# Clustering and Security

More details on redis cluster and security can be obtained from the following link:

https://www.linode.com/docs/databases/redis/install-and-configure-redis-on-centos-7