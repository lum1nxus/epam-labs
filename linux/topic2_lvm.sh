apt-get install lvm2
mkdir homework/ext homework/btrfs -p 
vgcreate vgtest /dev/sdb
lvcreate --name first_partition --size 1G vgtest
lvcreate --name seconnd_partition --size 2G vgtest
mkfs.ext4 /dev/vgtest/first_partition ; mount /dev/vgtest/first_partition ~/homework/ext -o rw,defaults
mkfs.btrfs /dev/vgtest/second_partition ; mount /dev/vgtest/second_partition ~/homework/btrfs -o rw,defaults
blkid /dev/vgtest/first_partition >> /etc/fstab #configure /etc/fstab file to automount at each reboot
#change line in /etc/fstab to such format | UUID=..... /mountpath ext4 defaults 0 0 |

