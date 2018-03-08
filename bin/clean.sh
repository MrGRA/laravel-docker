#!/bin/bash

docker rm -f $(docker ps -aq)
docker volume rm $(docker volume ls -qf dangling=true)
