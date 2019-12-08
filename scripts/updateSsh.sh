#!/bin/sh

ssh-keygen -R '[127.0.0.1]:8022'
ssh-keyscan  -t ecdsa   -p 8022 127.0.0.1 >> ~/.ssh/known_hosts

