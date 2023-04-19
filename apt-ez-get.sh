#!/bin/bash

echo '
 ====================
|     apt-ez-get     |
|    DJStomp 2023    |
| No Rights Reserved |
 ====================
'
echo "Checking current permissions..."
if [ "$EUID" -ne 0 ]
  then echo "(!) Insufficient permissions. Aborting..."
  exit
fi
echo "(OK) Sufficient permissions present."

echo "Updating package registry..."
if eval "sudo apt-get update -q"; then
    echo "(OK) Package registry updated"
else
    echo "(!) Problem updating packages! Aborting..."
    exit
fi
sync

echo "Processing arguments..."
cmd_prefix='sudo apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" '
PKGS=""
for package in "$@"
do
    if [[ $package =~ ^[^-].+? ]]; then
        PKGS="$package $PKGS"
    else
        echo "(!) Ignoring invalid argument: $package"
    fi
done

if [[ -n $PKGS ]]; then
    echo "(OK) Calling apt-get to install the following packages: $PKGS"
else
    echo "(!) Constructed command appears to be invalid: $cmd_prefix$PKGS"
    echo "(!) Reason: zero length for PKGS"
    echo "(!) Aborting..."
    exit
fi

export DEBIAN_FRONTEND=noninteractive

if eval "$cmd_prefix$PKGS"; then
    echo "(OK) No errors detected, packages successfully installed."
else
    echo "(!!) Sorry, encountered unknown error(s) [NONZERO EXIT CODE]."
    echo "     Unable to install the requested packages autonomously."
    echo "     Try installing manually with sudo apt-get install -y $PKGS"
fi
