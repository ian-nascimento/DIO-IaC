#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.20.10
sudo docker swarm join-token worker | grep docker >> /vagrant/configure-worker.sh