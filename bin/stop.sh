#!/bin/bash

if [ "$(pwd | grep bin)" ]
then
	docker-compose -f ../docker-compose.yml down
else
	docker-compose -f docker-compose.yml down
fi