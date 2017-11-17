# Bluebird Docker Container

A docker container to develop the Bluebird website.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

In order to set up and run this proyect you need the following

- Latest package of Docker Community Edition running in your local machine

### Installing

Open a console in your machine and execute the following commands:

*Clone this repository into bluebird directory, replace __$username__ with your own github username:*

```
git clone https://$username@github.com/praxent-davidmartinez/bluebird-docker-container.git bluebird
```

*Download the source docker image from hub:*

```
docker pull php:7.0-apache
```

*cd into the repository directory, please run all of the following commands from this directory:*

```
cd bluebird
```

*Create custom image for the proyect, this will install the needed php extensions for the proyect:*

```
docker build -t wp-bluebird .
```

*Grant start, stop and import-db scripts execution permissions, this will help you to start and stop the docker containers for webserver and database server:*

```
chmod 777 bin/start.sh && chmod 777 bin/stop.sh && chmod 777 bin/import-db.sh
```

*Start the containers for the php/apache webserver and mysql database server:*

```
./bin/start.sh
```

*Place the latest database backup into __database__ directory and name it: __latest.sql__*

```
./bin/import-db.sh
```

*Now you can clone the website code into __app__ directory, replace __$username__ with your own github username:*

```
git clone https://$username@github.com/praxent/bluebird.git app
```

*Copy and paste the uploads backup copy into __app/wp-content/__*

```
cp -R $uploads-dir-backup app/wp-content/
```

That's it! Now you can go to: *__http://localhost:8000__*

If you want to connect to the MySQL database from your preferred database manager software, use the following settings:

- username: *bluebird*
- password: *bluebird_*
- database: *bluebird*
- host: *127.0.0.1*
- port: *8009*

To check PHP and Apache error and access logs you can run:

```
docker logs --follow $container_id
```

## Built With

* [Docker](https://docs.docker.com/) - Docker Documentation
* [PHP Docker Image](https://hub.docker.com/_/php/) - PHP 7.0 / Apache
* [MySQL Docker Image](https://hub.docker.com/_/mysql/) - MySQL 5.7

## Versioning

We use [GitHub](https://github.com/) for versioning.

## Authors

* **David Martinez** - *Initial work* - [David Martinez@Praxent](https://github.com/praxent-davidmartinez)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

