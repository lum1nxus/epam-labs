cat disk.log | tr -s ' ' | cut -d ' ' -f 1,3,6 | sort >> sortedvalues.log
du -a /etc | sort -n -r | head -n 10 

