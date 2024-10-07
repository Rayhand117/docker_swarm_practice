#!/bin/bash

# Remove lines containing 192.168.50.10 and 192.168.50.11 from known_hosts
sed -i '/192.168.50.10/d' /home/aelia/.ssh/known_hosts
sed -i '/192.168.50.11/d' /home/aelia/.ssh/known_hosts