DATE:=$(shell date +"%Y%m%d%H%M%S")

push: build
	docker push registry.digitalocean.com/bhuggins/braxton-wordpress:$(DATE)
	docker push registry.digitalocean.com/bhuggins/braxton-wordpress:latest

build:
	docker build --pull -t registry.digitalocean.com/bhuggins/braxton-wordpress:$(DATE) -f Dockerfile .
	docker tag registry.digitalocean.com/bhuggins/braxton-wordpress:$(DATE) registry.digitalocean.com/bhuggins/braxton-wordpress:latest
