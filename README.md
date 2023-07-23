OpenCart 3 Docker Compose
=========================

This repository provides a Docker Compose configuration for launching OpenCart 3 using Nginx, PHP-FPM, MySQL, and Adminer. With this setup, you can quickly get a local OpenCart 3 environment up and running for development or testing purposes.

Prerequisites
-------------

Before using this Docker Compose setup, make sure you have the following installed on your system:

1.  Docker
2.  Docker Compose

Getting Started
---------------

Follow the steps below to set up the OpenCart environment:

1.  Clone this repository to your local machine.
    
2.  Create an `.env` file in the root of the cloned repository with the necessary configurations:
    

`
   #Database config
   MYSQL_DATABASE=opencart_db
   MYSQL_USER=opencart_user
   MYSQL_PASSWORD=your_password
   MYSQL_ROOT_PASSWORD=your_root_password
   PHP_IDE_CONFIG=serverName=Docker
   #Site name (example: mysite.com)
   SITE_NAME=localhost
   #Using the site over
   https NGINX_CONF_DIRECTORY=hosts
`

3.  Start the containers using Docker Compose:


`docker-compose up -d`

4.  Access OpenCart through your web browser at `http://localhost`. You can access Adminer at `http://localhost:8080` to manage the database.

Managing the Environment
------------------------

Use the following commands to manage the Docker containers:

*   To start the containers: `docker-compose up -d`
*   To restart the containers: `docker-compose restart`
*   To stop the containers: `docker-compose stop`
*   To remove the containers: `docker-compose down`
*   To remove all images: `docker rmi nginx opencart-php-fpm db adminer`

Customizations
--------------

### PHP Configuration

If you need to customize the PHP configuration, you can edit the `php.ini` file located at `./images/php/php.ini`.

### Adding Your OpenCart Source

To add your OpenCart source code, place it in the `./www` directory.

### File Permissions

To ensure proper file permissions for OpenCart, the `www` directory is set to be owned by the `www-data` group within the containers. Additionally, to avoid permission issues, the `www` directory is writable by the `www-data` group. Use the following command if you encounter file permission issues:

`sudo chown -R :www-data www && sudo chmod -R g+w www`
