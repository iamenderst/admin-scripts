1. Edit revaliases and ssmtp.conf for your environment  
2. Copy revaliases and ssmtp.conf to /etc/ssmtp/  
3. Copy watchdog-lb to /config/scripts/  
4. Make sure watchdog-lb is executable  
```chmod +x /config/scripts/watchdog-lb```  
5. Now configure the edgerouter  
```
  configure  
  set load-balance group G transition-script /config/scripts/watchdog-lb  
  commit  
  save  
```
