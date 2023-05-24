## Set up with vue
https://medium.com/techvblogs/how-to-install-vue-3-in-laravel-8-from-scratch-908b78b63ce <br>
https://stackoverflow.com/questions/69218549/laravel-mix-unknown-option-hide-modules-error

## Run Project
If this is your first time cloning this project, run
```
npm i
npm ci
composer i
```
Copy text in .env.example then create .env file and paste the text to .env file. Then generate laravel key by running the command below
```
php artisan key:generate
```

u should be able to run the project now using these two commands at the same time (use two terminal)
```
npm run watch
php artisan serve
```

## Icon resource
https://icons8.com

## Docker
Create a file in root directory name ```Dockerfile```
```
FROM php:7.4-apache
WORKDIR /var/www/html

# Mod rewrite
RUN a2enmod rewrite

# Install dependencies
RUN apt-get update -y && apt-get install -y libicu-dev unzip zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql intl

```
Create a file in root directory name ```docker-compose.yml```
```
services:
  bd-admin:
    container_name: bd-admin
    # path to project. can be also an url
    # since it's a relative path, it will be relative to the location of the docker-compose.yml file
    build: .
    volumes:
      # mount the project directory on the host to the container
      - .:/var/www/html
    ports:
      # map the port 80 of the container to the port 8080 of the host
      - 8080:80

```

build
```
docker build -t imageName .
or
docker-compose build
```

run
```
docker run -p 8080:80 imageName
or
docker-compose up
```

ssh terminal
```
docker exec -it containerName
```

the .htaccess file is used to redirect user from /public to / <br>
if we don't include .htaccess accessing the website would require us to go /public
