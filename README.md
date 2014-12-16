Linux System Information
======================
Very simple script that prints out general system information including uptime, Disk Space utilization, and Home Space Utilization

Sample
======================
```
System Information Report For MacBook

Generated 12/15/14 12:25:56 PM MST, by root

System Uptime

12:25  up 6 days,  2:36, 2 users, load averages: 1.37 1.35 1.25
Disk Space Utilization

Filesystem                          Size   Used  Avail Capacity   iused    ifree %iused  Mounted on
/dev/disk2                         111Gi   87Gi   24Gi    79%  22842382  6166864   79%   /
devfs                              334Ki  334Ki    0Bi   100%      1156        0  100%   /dev
/dev/disk1s1                       466Gi  398Gi   68Gi    86% 104331335 17765047   85%   /Volumes/Files
map -hosts                           0Bi    0Bi    0Bi   100%         0        0  100%   /net
map auto_home                        0Bi    0Bi    0Bi   100%         0        0  100%   /home

Home Space Utilization

 31G	/Users/dejan
```

Citation
======================
This script was developed by following the guide in the book [The Linux Command Line: A Complete Introduction Paperback](http://www.amazon.com/The-Linux-Command-Line-Introduction/dp/1593273894) by William E. Shotts Jr.