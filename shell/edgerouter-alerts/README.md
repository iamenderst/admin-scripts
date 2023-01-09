Copy revaliases and ssmtp.conf to /etc/ssmtp/
Copy watchdog-lb to /config/scripts/
Make sure watchdog-lb is executable
  chmod +x /config/scripts/watchdog-lb
Now configure the edgerouter
  configure
  set load-balance group G transition-script /config/scripts/watchdog-lb
  commit
  save
