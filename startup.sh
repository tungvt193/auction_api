#!/bin/bash

# REPLACE IMAGE FROM DOCKERCOMPOSE
sed -i "s/__REGISTRY_IMAGE__/registry.gitlab.com\/its-global\/biz\/auction-api\/staging/" docker-compose.yml

docker-compose up -d