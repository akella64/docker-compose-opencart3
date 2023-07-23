# Start all
start:
	docker-compose up -d

# Restart containers
restart:
	docker-compose restart

# Compose stop containers
stop:
	docker-compose stop

# Stop and delete containers
remove:
	docker-compose down

# Remove all images
rm-images:
	docker rmi nginx php db adminer

# add www-data group for sites
set-edding-site:
	sudo chown -R :www-data www && sudo chmod -R g+w www
