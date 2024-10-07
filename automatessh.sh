#!/bin/bash

echo > ~/.ssh/known_hosts
for i in {10..11}
do
  ssh-keyscan -H 192.168.50.$i >> ~/.ssh/known_hosts
done
