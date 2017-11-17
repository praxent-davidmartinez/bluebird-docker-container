#!/bin/bash

if [ "$(pwd | grep bin)" ]
then
	docker-compose -f ../docker-compose.yml up -d
else
	docker-compose -f docker-compose.yml up -d
fi