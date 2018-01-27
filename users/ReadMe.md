# Create a user

To create a user "chen0040":

```bash
sudo useradd -m chen0040
```

# Set password for a user

To set password for user "chen0040" (centos):

```bash
passwd chen0040
```

# Add a user to sudoers group

To add user "chen0040" to sudoers (centos):

```bash
usermod -aG wheel chen0040
```

# To switch to another user

To switch to user "chen0040":

```bash
su - chen0040
```
