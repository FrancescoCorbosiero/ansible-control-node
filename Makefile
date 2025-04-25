# Makefile

IMAGE_NAME=ansible
CONTAINER_NAME=ansible

build:
	docker-compose build

up:
	docker-compose up

bash:
	docker exec -it $(CONTAINER_NAME) bash

run:
	docker-compose run --rm ansible

stop:
	docker-compose down

ping:
	docker exec -it $(CONTAINER_NAME) ansible vps \
	  --key-file /root/.ssh/ansible \
	  -i /ansible/inventory/inventory.ini \
	  -m ping
