To increase the disk size for azure VM, write and run a script similar to  

resize-disk-size.ps1

At this point, the VM OS disk size will be increased, however, the linux OS disk will still be the original value (which is 30GB), this can be shown by running the following command in the VM:

```bash
df -h
```

To increase the disk space in the CentOS, partition the linux OS by running the following command in the VM:

```bash
sudo fdisk /dev/sda
```

Press u to change the units to sectors.

Press p to list the partitions details. The most important information is the starting sector (e.g. 2048).

Next step is to delete the partition (it will not delete Your data, it will only alter the partition table). 
Press d and select the partition (if it’s only one partition, it will be selected automatically).

Now we are going to create a new partition. Press n and next press p to create a primary partition. 
Press 1 or 2 to create first or second partition (depends on which partition we deleted). Next, enter the same value for starting sector from step where we have been printing an informations about partitions. To end accept the default end sector to use the entire disk.

Write the partitions pressing w. If there will be some error, just ignore it - it's OK.

Reboot
$ sudo reboot
Resize the filesystem
$ sudo resize2fs /dev/sdaX
Where X is resized partition's number (e.g., /dev/sda1). This operation can take a long time, so don't be nervous


In case the resize2fs runs into error such as the following:

resize2fs: Bad magic number in super-block while trying to open /dev/sda1
Couldn't find valid filesystem superblock.

This may be due to resize2fs does not support the type of /dev/sda1 in which case is xfs, this can be solve by running the following command:

```bash
sudo yum install xfsprogs.x86_64 --assumeyes
xfs_info /dev/sda1
sudo xfs_growfs /dev/sda1
```

# Links
for more information, follow these links: 

https://lnx.azurewebsites.net/resizing-a-linux-vm-system-disk-in-microsoft-azure/
http://stackoverflow.com/questions/13362910/trying-to-resize2fs-eb-volume-fails





