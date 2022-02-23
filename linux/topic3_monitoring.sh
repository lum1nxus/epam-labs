stress --cpu 2<half of the proccesors you attached to vm> --timeout 30s
watch uptime
ps -eo pid,%mem --sort=-%mem | head
ps -x --forest
kill -9 $(lsof -t -u <username>)