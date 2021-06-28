#!/bin/bash

# REPLACE IMAGE FROM DOCKERCOMPOSE
sed -i "s/__REGISTRY_IMAGE__/registry.gitlab.com\/its-global\/biz\/auction-api\/staging/" docker-compose.yml
sed -i "s/__MYSQL_ROOT_PASSWORD__/auction/" docker-compose.yml

docker-compose up -d