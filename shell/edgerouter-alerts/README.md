1. Copy revaliases and ssmtp.conf to /etc/ssmtp/  
2. Copy watchdog-lb to /config/scripts/  
3. Make sure watchdog-lb is executable  
`chmod +x /config/scripts/watchdog-lb`  
4.Now configure the edgerouter  
```
  configure  
  set load-balance group G transition-script /config/scripts/watchdog-lb  
  commit  
  save  
```
