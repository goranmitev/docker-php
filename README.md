# docker-php

- Make sure you put "database" as the host name for mysql in your .env file

Run migrations or refresh database:
docker-compose exec -T application php artisan migrate
docker-compose exec -T application php artisan migrate:fresh --seed
docker-compose exec -T application php artisan migrate:refresh --seed


Start working:
docker-compose up -d

Stop working:
docker-compose down --remove-orphans


Run bash
docker exec -it dockerphp_database_1 /bin/bash

List all containers (only IDs)
docker ps -aq

Stop all running containers
docker stop $(docker ps -aq)

Remove all containers
docker rm $(docker ps -aq)

Remove all images
docker rmi $(docker images -q)


Run composer
docker run --rm --interactive --tty --volume ${PWD}:/app composer install --ignore-platform-reqs