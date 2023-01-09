#!/bin/bash
# Verify email address
inbox=$1

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

user=`echo $inbox | cut -d\@ -f1`
domain=`echo $inbox | cut -d\@ -f2`

# Find domain
domaincheck=$(ls -d /var/surge/surgemail/$domain)

if [ -d "$domaincheck" ]; then
  echo "Domain found - $domain"
  echo
else
  echo "Domain $domain not found"
  echo
  exit 1
fi

# Find user
#path=`find /var/surge/surgemail/$domain -maxdepth 3 -name "$user"`
path=`tellmail path $inbox`

if [ -d "$path" ]; then
  echo "User found - $user"
  echo
else
  echo "User $user not found"
  echo
  exit 1
fi

# Echo out the path to the mailbox and show disk usage
echo $path
size=$(du -sch $path/mdir|tail -1)

echo $size
echo

exit 0


