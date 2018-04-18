# docker-php

- Make sure you put "database" as the host name for mysql in your .env file

Run migrations or refresh database:
docker-compose exec -T application php artisan migrate
docker-compose exec -T application php artisan migrate:refresh --seed


Start working:
docker-compose up -d

Stop working:
docker-compose down --remove-orphans