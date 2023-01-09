#!/bin/bash

inbox=$1

# Check email address structure
if [[ "$inbox" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]
then
  echo
  echo "Searching ..."
  echo
else
  echo "Email address $inbox is invalid."
  echo
  exit 1
fi

# Search for the doamin
user=`echo $inbox | cut -d\@ -f1`
domain=`echo $inbox | cut -d\@ -f2`

domaincheck=$(ls -d /var/surge/surgemail/$domain)

if [ -d "$domaincheck" ]; then
  echo "Domain found - $domain"
  echo
else
  echo "Domain $domain not found"
  echo
  exit 1
fi

# Search for the user
path=`tellmail path $inbox`

if [ -d "$path" ]; then
  echo "User found - $user"
  echo
else
  echo "User $user not found"
  echo
  exit 1
fi

echo "Restoring Inbox for $inbox ... "
sleep 3
echo "Please be patient ..."
echo

# Pull the data out of the ZFS snapshots and rsync it back to the user inbox
destpath=`echo $path | sed 's/\/var\/surge\/surgemail//'`
snapdir="/var/surge/.zfs/snapshot/daily_*/surgemail"$destpath"/mdir/"
for i in $snapdir; do rsync -avr $i $path/mdir/ 2>&1 >/dev/null; done

size=$(du -sch $path/mdir|tail -1)

echo "Inbox restoration for $inbox complete."
echo "Inbox size is $size"
echo

exit 0

