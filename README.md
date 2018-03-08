
# Laravel Docker Environment

* No Mamp or similar programs
* No Vagrant or similar VM setups
* No Globally installed PHP
* No Globally installed Composer


## Clone it

```
git clone https://github.com/MrGRA/laravel-docker.git
cd laravel-docker
```

## Step 1 — grab the latest Laravel release or your project

``git clone https://github.com/laravel/laravel.git app``

Wipe the .git directory.
```
cd app
rm -rf .git
```

or 

```
git clone <ypur project> app
cd app
```

## Step 2 — Install dependencies

```
docker run --rm -v $(pwd):/app composer install
```

* We use the --rm flag to ensure this container does not linger around following the install.
* -v $(pwd):/app is used to mount the current directory on the host (your cpu) to /app in the container — this is where composer running inside the container expects to find a composer.json

## Step 3 - Prepare .env
copy the .env.example file into our own .env file.

``cp .env.example .env``

Edit the .env file with your favorite editor and change the values
```
APP_NAME=Dashboard
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost or domain

LOG_CHANNEL=stack

DB_CONNECTION=mysql
DB_HOST=database
DB_PORT=3306
DB_DATABASE=da
DB_USERNAME=root
DB_PASSWORD=root

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
SESSION_LIFETIME=120
QUEUE_DRIVER=sync

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
```

## Step 4 — Run It
```
cd ..
docker-compose up -d
```

The very first time you run this, it’s going to take minutes to start as it will need to download the images for all 3 services. Subsequent start times will be in the region of a second or 2, so don’t be put off by that initial download time.

## Step 5 - Application key

```
docker-compose exec app php artisan key:generate
```

## Step 5 - Navigate to [localhost](http://localhost) (if local)


## Usefull commands

```
docker-compose exec app php artisan migrate --seed
docker-compose exec app php artisan make:controller MyController
```
For the full list:

``docker-compose exec app php artisan``

## Bonus

To remove all Docker images from your computer run:

``./bin/clean/sh``

To stop all the machines:
``docker-compose stop``


All set - Have fun
