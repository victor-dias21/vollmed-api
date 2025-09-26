#! /bin/bash

docker load -i vollmed-api.tar
mv docker-compose-prod.yaml docker-compose.yaml

container_ids=$(docker ps -q)

if [ -z "$container_ids" ]; then
  echo "Não existem containers em execução"
else
  for container_id in $container_ids; do
    echo "Parando container: $container_id "
    docker stop $container_id
  done
  echo "Todos os containers em execução foram parados"
fi

docker compose up -d
