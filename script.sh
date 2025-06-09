#!/bin/bash
echo "Criando imagens..."

docker build -t jotabr092/backend-dio-app-base:1.0 backend/.
docker build -t jotabr092/database-dio-app-base:1.0 database/.

echo "Push de imagens..."

docker push jotabr092/backend-dio-app-base:1.0
docker push jotabr092/database-dio-app-base:1.0

echo "Criando serviços no cluster kubernetes..."

kubctl apply -f ./services.yml

echo "Criando deploy..."

kubectl apply -f ./deploymet.yml