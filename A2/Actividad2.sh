#!/bin/bash

gitUser=$(git config user.name)
githubLink="https://api.github.com/users/"
apiLink="$githubLink$gitUser"

curl -s $apiLink | userId=$(jq '.id')
curl -s $apiLink | created=$(jq '.created_at')

saludo="Hola $gitUser, Id: $userId, Fecha de creacion de cuenta: $created"
dateName=$(date '+%m-%d-%Y:%H:%M:%S')

mkdir -p "/tmp/$dateName"
echo $saludo
echo $saludo > "/tmp/$dateName/saludos.log"